### BASH INSTALLATION COMMANDS FOR TOOL: hapmap3/broad/1
echo "OBC: INSTALLING TOOL: hapmap3/broad/1"
(
:
# Insert the BASH commands that install this tool
# You can use these environment variables: 
# ${OBC_TOOL_PATH}: path to tools directory 
# ${OBC_DATA_PATH}: path to data directory

# Insert the BASH commands that install this tool
# The following tools are available:
#  apt-get, wget

hapmap_path=${OBC_DATA_PATH}/hapmap3
map=${hapmap_path}/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.map

md5sum ${map} | grep "688bbbc2a10ee8dbb3524f1121d045d1"
if [ $? -ne 0 ] ; then
  mkdir -p ${hapmap_path}
  mapzip=${hapmap_path}/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.map.bz2
  wget -O ${mapzip} https://www.broadinstitute.org/files/shared/mpg/hapmap3/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.map.bz2
  bzip2 -ckd ${mapzip} > ${map}
fi

ped=${hapmap_path}/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.ped

md5sum ${ped} | grep "1a2bce84f9fb3157875e049fe1830d85"
if [ $? -ne 0 ] ; then
  pedzip=${hapmap_path}/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.ped.bz2
  wget -O ${pedzip} https://www.broadinstitute.org/files/shared/mpg/hapmap3/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.ped.bz2
  bzip2 -ckd ${pedzip} > ${ped}
fi


)
echo "OBC: INSTALLATION OF TOOL: hapmap3/broad/1 . COMPLETED"
### END OF INSTALLATION COMMANDS FOR TOOL: hapmap3/broad/1

### BASH VALIDATION COMMANDS FOR TOOL: hapmap3/broad/1
echo "OBC: VALIDATING THE INSTALLATION OF THE TOOL: hapmap3/broad/1"
(
:
# Insert the BASH commands that confirm that this tool is correctly installed
# In success, this script should return 0 exit code.
# A non-zero exit code, means failure to validate installation.


# Insert the BASH commands that confirm that this tool is correctly installed
# In success, this script should return 0 exit code.
# A non-zero exit code, means failure to validate installation.

hapmap_path=${OBC_DATA_PATH}/hapmap3
map=${hapmap_path}/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.map
ped=${hapmap_path}/hapmap3_r1_b36_fwd_consensus.qc.poly.recode.ped

md5sum ${map} | grep "688bbbc2a10ee8dbb3524f1121d045d1"
if [ $? -ne 0 ] ; then
  exit 1
fi

md5sum ${ped} | grep "1a2bce84f9fb3157875e049fe1830d85"
if [ $? -ne 0 ] ; then
  exit 1
fi

exit 0



)
if [ $? -eq 0 ] ; then
   echo "OBC: VALIDATION FOR TOOL: hapmap3/broad/1 SUCCEEDED"
else
   echo "OBC: VALIDATION FOR TOOL: hapmap3/broad/1 FAILED"
fi

### END OF VALIDATION COMMANDS FOR TOOL: hapmap3/broad/1

### SETTING TOOL VARIABLES FOR: hapmap3/broad/1
export hapmap3__broad__1__path="${OBC_DATA_PATH}/hapmap3/hapmap3_r1_b36_fwd_consensus.qc.poly.recode" # base filename of the dataset 
echo "OBC: SET hapmap3__broad__1__path=\"$hapmap3__broad__1__path\"   <-- base filename of the dataset "
### END OF SETTING TOOL VARIABLES FOR: hapmap3/broad/1

### CREATING BASH WITH TOOL VARIABLES
cat > ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh << ENDOFFILE
hapmap3__broad__1__path="${OBC_DATA_PATH}/hapmap3/hapmap3_r1_b36_fwd_consensus.qc.poly.recode"
ENDOFFILE
