### BASH INSTALLATION COMMANDS FOR TOOL: anaconda3/2019.03/1
echo "OBC: INSTALLING TOOL: anaconda3/2019.03/1"
### READING VARIABLES FROM ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh
. ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh

### READING VARIABLES FROM ${OBC_WORK_PATH}/plink__1_90beta_20190617__1_VARS.sh
. ${OBC_WORK_PATH}/plink__1_90beta_20190617__1_VARS.sh

(
:
# Insert the BASH commands that install this tool
# You can use these environment variables: 
# ${OBC_TOOL_PATH}: path to tools directory 
# ${OBC_DATA_PATH}: path to data directory

anaconda3_tmp=${OBC_TOOL_PATH}/anaconda3_tmp
anaconda3_path=${OBC_TOOL_PATH}/anaconda3
anaconda3_sh=${anaconda3_tmp}/Anaconda3-2019.03-Linux-x86_64.sh

${anaconda3_path}/bin/python --version
if [ $? -ne 0 ]; then
   mkdir -p ${anaconda3_tmp}
   wget -O ${anaconda3_sh} https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh 
   md5sum  ${anaconda3_sh} | grep 43caea3d726779843f130a7fb2d380a2
   if [ $? -ne 0 ]; then
      echo "MD5 checksum failed for ${anaconda3_sh}. Aborting!"
   else
      bash ${anaconda3_sh} -b -p ${anaconda3_path}
   fi
   
fi

)
echo "OBC: INSTALLATION OF TOOL: anaconda3/2019.03/1 . COMPLETED"
### END OF INSTALLATION COMMANDS FOR TOOL: anaconda3/2019.03/1

### BASH VALIDATION COMMANDS FOR TOOL: anaconda3/2019.03/1
echo "OBC: VALIDATING THE INSTALLATION OF THE TOOL: anaconda3/2019.03/1"
(
:
# Insert the BASH commands that confirm that this tool is correctly installed
# In success, this script should return 0 exit code.
# A non-zero exit code, means failure to validate installation.

anaconda3_path=${OBC_TOOL_PATH}/anaconda3

${anaconda3_path}/bin/python --version
if [ $? -ne 0 ]; then
   exit 1
fi

exit 0



)
if [ $? -eq 0 ] ; then
   echo "OBC: VALIDATION FOR TOOL: anaconda3/2019.03/1 SUCCEEDED"
else
   echo "OBC: VALIDATION FOR TOOL: anaconda3/2019.03/1 FAILED"
fi

### END OF VALIDATION COMMANDS FOR TOOL: anaconda3/2019.03/1

### SETTING TOOL VARIABLES FOR: anaconda3/2019.03/1
export anaconda3__2019_03__1__path="${OBC_TOOL_PATH}/anaconda3/bin/python" # python executable 
echo "OBC: SET anaconda3__2019_03__1__path=\"$anaconda3__2019_03__1__path\"   <-- python executable "
### END OF SETTING TOOL VARIABLES FOR: anaconda3/2019.03/1

### CREATING BASH WITH TOOL VARIABLES
cat > ${OBC_WORK_PATH}/anaconda3__2019_03__1_VARS.sh << ENDOFFILE
anaconda3__2019_03__1__path="${OBC_TOOL_PATH}/anaconda3/bin/python"
ENDOFFILE
