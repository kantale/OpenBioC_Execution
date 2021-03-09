#!/bin/bash

# filename: install.sh
# author: @koutoulakis
#SETTING COLORS FOR OUTPUTS

WHITE='\e[97m'
RED='\033[0;31m'
NC='\033[0m' # No Color
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'

showHelp() {
# `cat << EOF` This means that cat should stop reading when EOF is detected
cat << EOF  
Install OpenBio Execution Environment

-h --help                  : Display help

-e --execution_environment : Specify the type of execution engine.
                             Available options: airflow, cwl-airflow 

-d  --execution_env_dir    : Directory of docker compose files and configurations. Default : ${HOME}

-W --workflow_port         : Workflow Management System Port. Default: 8080

-O --api_port              : OpenBio API Port. Default: 5000

-D --database_port         : Database Port. Default: 5432

-R --resource_port         : Resource Monitoring Port. Default: 19998

EOF
# EOF is found above and hence cat command stops reading. This is equivalent to echo but much neater when printing out.
}


wmsError() {
cat << EOF
Unrecognized type of execution engine - $1
-e  --execution_environment : Specify the type of execution engine.
                              Available options: airflow, cwl-airflow 
EOF
exit 1
}

portcheck (){
	# Check the port if it is in use
	netstat -pant /dev/null 2>&1 | grep -w $1  > /dev/null 2>&1 
	if [ $? -eq 0 ] ; then
		echo -e "${RED}PORT-ERROR${NC}:  $2 $1 is already in use, Please retry again with different port!"
		exit 1
	fi	
}

# $@ is all command line parameters passed to the script.
# -o is for short options like -v
# -l is for long options with double dash like --version
# the comma separates different long options
# -a is for long options with single dash like -version
options=$(getopt -l "help,execution_environment:,execution_env_dir:,workflow_port:,api_port:,database_port:,resource_port:" -o "he:d:W:O:D:R: " -a -- "$@")

# set --:
# If no arguments follow this option, then the positional parameters are unset. Otherwise, the positional parameters 
# are set to the arguments, even if some of them begin with a ‘-’.
eval set -- "$options"

while true
do
    case $1 in
    -h|--help)  
        showHelp
        exit 0
        ;;
    -e|--execution_environment) 
        export WMS=$2; shift 2;;
    -d|--execution_env_dir)
		export ENVIRONMENT_PATH=$2; shift 2;; #OBC_EXECUTOR_PATH
    -W|--workflow_port)
        export WMS_PORT=$2; shift 2;;
    -O|--api_port)
        export API_PORT=$2; shift 2;;
    -D|--database-port)
        export DB_PORT=$2; shift 2;;
    -R|--resource_port)
        export RESOURCE_PORT=$2; shift 2;;
    --) shift; break ;;
    *) break ;;
        
    esac
done

echo "$WMS_PORT $API_PORT $DB_PORT $RESOURCE_PORT"
#  Check if the specifies workflow engine is one of the selectionss
[ "$WMS" == "cwl-airflow" ] || [ "$WMS" == "airflow" ] && echo "Selected Worfkflow Engine : $WMS" || wmsError $WMS

[ -z "$ENVIRONMENT_PATH" ] && echo "Set the default directory ${HOME}/" && export ENVIRONMENT_PATH="${HOME}"
#  Set the default variables to 
[ -z "$WMS_PORT" ] && echo "WMS Port is not setted. Set the default port 8080" && export WMS_PORT=8080
[ -z "$API_PORT" ] && echo "API Port port is not setted. Set the default port 5000" && export API_PORT=5000
[ -z "$DB_PORT" ] && echo "Database Port is not setted. Set the default port 5432" && export DB_PORT=5432
[ -z "$RESOURCE_PORT" ] && echo "Resource Monitoring port is not setted. Set the default port 19998" && export RESOURCE_PORT=19998

# Check the ports using the portcheck function 
portcheck $WMS_PORT "WMS_PORT" && portcheck $API_PORT "API_PORT" && portcheck $DB_PORT "DB_PORT" && portcheck $RESOURCE_PORT "RESOURCE_PORT"



# Check if docker exist in your environment

export DISTRO_ID=$(lsb_release -i -s)

echo "Welcome to the OpenBio Executor, ${USER}!"
echo "Installation will take a few minutes. Please be patient..."

echo -e "[${YELLOW}-${NC}] State 1/3 (Check docker) "

# Save the distroID to optimize the installation of docker
echo -e "[${YELLOW}-${NC}] Check if docker already exists..."
# 1> /dev/null 2>&1 not show the output
docker -v 1> /dev/null 2>&1
if [ $? -ne 0 ] ; then 
	echo -e "[${RED}-${NC}] DOCKER IS NOT INSTALLED, please install docker before your Execution Environment installation."
	# Save the distroID to optimize the installation of docker
	echo -e "${WHITE}***You could use the commands below to install the Docker Engine***${NC}\n${YELLOW}
	$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7EA0A9C3F273FCD8
	$ sudo apt-get update
	$ curl -fsSL https://get.docker.com -o get-docker.sh
	$ sudo sh get-docker.sh
	${NC}
	"
	
fi

echo -e "[${YELLOW}-${NC}] State 2/3 (Check docker-compose) "

echo -e "[${YELLOW}-${NC}] Check if docker already exists..."
docker-compose -v
if [ $? -ne 0 ] ; then
	echo -e "[${YELLOW}-${NC}] Docker-Compose is not installed, please install docker-compose before your Execution Environment installation."
	echo -e "${WHITE}***You could use the commands below to install the Docker Engine***${NC}\n${YELLOW}
	$ sudo curl -L \"https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose
	$ sudo chmod +x /usr/local/bin/docker-compose
	${NC}
	"	
fi

echo -e "[${YELLOW}-${NC}] State 3/3 (Setting up variables and installing the OpenBio Executor) "

#  Create a unique string as a executor name
export EXECUTOR_INSTANCE=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 6 | head -n 1)
# Set OBC_EXECUTOR PATH
export WHOLE_ENV_PATH="$ENVIRONMENT_PATH/obc_$EXECUTOR_INSTANCE"

echo -e "[${YELLOW}-${NC}] Installation path for the Execution Environment: ${WHOLE_ENV_PATH}" 
mkdir -p ${WHOLE_ENV_PATH}
export OBC_USER_ID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

export NETDATA_ID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)



echo -e "[${YELLOW}-${NC}] Client ID for OpenBioC Server : \033[38;2;0;255;0m${OBC_USER_ID}\033[0m"
export PUBLIC_IP=$(curl http://ip4.me 2>/dev/null | sed -e 's#<[^>]*>##g' | grep '^[0-9]')

# File contains images
wget -O ${WHOLE_ENV_PATH}/docker-compose.yml https://raw.githubusercontent.com/manoskout/OpenBioC_Execution/master/docker-compose-${WMS}.yml
# Config File only for airflow
if [[ "$WMS" == *"airflow"* ]]; then
	wget -O ${WHOLE_ENV_PATH}/airflow.cfg https://raw.githubusercontent.com/manoskout/OpenBioC_Execution/master/airflow.cfg
fi


# Set obc_executor_run.sh (Optional)
# wget https://raw.githubusercontent.com/manoskout/docker-airflow/master/obc_executor_run.sh
echo -e "[${YELLOW}-${NC}] Running Directory : $(pwd)"


# Environment variables that used from Executor
cat >> ${WHOLE_ENV_PATH}/.env << EOF
EXECUTOR_INSTANCE=${EXECUTOR_INSTANCE}
POSTGRES_USER=airflow
POSTGRES_PASSWORD=airflow
POSTGRES_DB=airflow
OBC_USER_ID=${OBC_USER_ID}
PUBLIC_IP=${PUBLIC_IP}
OBC_EXECUTOR_PORT=${API_PORT}
OBC_WMS_PORT=${WMS_PORT}
NETDATA_MONITORING_PORT=${RESOURCE_PORT}
EXECUTOR_DB_PORT=${DB_PORT}
NETDATA_ID=${NETDATA_ID}
WORKFLOW_FORMAT=${WMS}
EOF

#TODO -> change using docker-compose up -f asfsedfsdf.yml(FAILED)

cd $WHOLE_ENV_PATH
docker-compose up --build -d

if [ $? -eq 0 ] ; then 

	export OBC_EXECUTOR_URL="http://${PUBLIC_IP}:${API_PORT}/${OBC_USER_ID}"
	export NETDATA_URL="http://${PUBLIC_IP}:${RESOURCE_PORT}/${NETDATA_ID}"
	echo -e "${GREEN}\n\n\n Successful installation \n\n\nClose tests ....\n\n${NC}"
    docker-compose down
	echo -e "${YELLOW}**IMPORTANT**${NC}"
	echo -e "${GREEN}\n\t Add the link below to your profile page in openbio.eu. For more info see: https://github.com/kantale/OpenBioC/tree/master/Documentation#installation \n${NC}"
	echo -e "${LGREEN}${OBC_EXECUTOR_URL}${NC}"
	echo -e "${GREEN}\n\tNetdata url: (Use this URL anytime to check the resources of the execution environment) \n${NETDATA_URL}${NC}"

	echo -e "${YELLOW}***IMPORTANT***${NC}\n${YELLOW}
	1)Before being able to run workflows you need to start the execution environment with the following commands:${NC}
		$ cd ${WHOLE_ENV_PATH}
		$ docker-compose up \n
	2)To stop the execution environment run:
		$ cd ${WHOLE_ENV_PATH}
		$ docker-compose down
	${NC}
	"
else
	echo "docker-compose is not running. Check if docker is installed and that you have the right privileges to run it."
	docker-compose down
fi
