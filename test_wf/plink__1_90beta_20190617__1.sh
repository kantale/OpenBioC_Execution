### BASH INSTALLATION COMMANDS FOR TOOL: plink/1.90beta_20190617/1
echo "OBC: INSTALLING TOOL: plink/1.90beta_20190617/1"
### READING VARIABLES FROM ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh
. ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh

(
:
# Insert the BASH commands that install this tool
# You can use these environment variables: 
# ${OBC_TOOL_PATH}: path to tools directory 
# ${OBC_DATA_PATH}: path to data directory

plink_path=${OBC_TOOL_PATH}/plink
plink_exec=${plink_path}/plink

${plink_exec} --file ${plink_path}/toy
if [ $? -ne 0 ] ; then
 mkdir -p ${plink_path}
 plink_zip=${plink_path}/plink_linux_x86_64_20190617.zip
 wget -O ${plink_zip} http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20190617.zip
 unzip -d ${plink_path} ${plink_zip}
fi


)
echo "OBC: INSTALLATION OF TOOL: plink/1.90beta_20190617/1 . COMPLETED"
### END OF INSTALLATION COMMANDS FOR TOOL: plink/1.90beta_20190617/1

### BASH VALIDATION COMMANDS FOR TOOL: plink/1.90beta_20190617/1
echo "OBC: VALIDATING THE INSTALLATION OF THE TOOL: plink/1.90beta_20190617/1"
(
:
# Insert the BASH commands that confirm that this tool is correctly installed
# In success, this script should return 0 exit code.
# A non-zero exit code, means failure to validate installation.

plink_path=${OBC_TOOL_PATH}/plink
plink_exec=${plink_path}/plink

${plink_exec} --file ${plink_path}/toy



)
if [ $? -eq 0 ] ; then
   echo "OBC: VALIDATION FOR TOOL: plink/1.90beta_20190617/1 SUCCEEDED"
else
   echo "OBC: VALIDATION FOR TOOL: plink/1.90beta_20190617/1 FAILED"
fi

### END OF VALIDATION COMMANDS FOR TOOL: plink/1.90beta_20190617/1

### SETTING TOOL VARIABLES FOR: plink/1.90beta_20190617/1
export plink__1_90beta_20190617__1__path="${OBC_TOOL_PATH}/plink/plink" # installation path of executable 
echo "OBC: SET plink__1_90beta_20190617__1__path=\"$plink__1_90beta_20190617__1__path\"   <-- installation path of executable "
### END OF SETTING TOOL VARIABLES FOR: plink/1.90beta_20190617/1

### CREATING BASH WITH TOOL VARIABLES
cat > ${OBC_WORK_PATH}/plink__1_90beta_20190617__1_VARS.sh << ENDOFFILE
plink__1_90beta_20190617__1__path="${OBC_TOOL_PATH}/plink/plink"
ENDOFFILE
