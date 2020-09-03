. ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh
. ${OBC_WORK_PATH}/plink__1_90beta_20190617__1_VARS.sh
. ${OBC_WORK_PATH}/anaconda3__2019_03__1_VARS.sh
. ${OBC_WORK_PATH}/WDycJ_inputs.sh
. ${OBC_WORK_PATH}/obc_functions.sh
OBC_START=$(eval "declare")
:
# Insert the BASH commands for this step.
# You can use the variable ${OBC_WORK_PATH} as your working directory.

input__pedmap__pca_plink_and_plot__1=${hapmap3__broad__1__path}


OBC_CURRENT=$(eval "declare")
comm -3 <(echo "$OBC_START" | grep -v "_=" | sort) <(echo "$OBC_CURRENT" | grep -v OBC_START | grep -v PIPESTATUS | grep -v "_=" | sort) > ${OBC_WORK_PATH}/step__main_step__hapmap3_pca__1__1_VARS.sh
