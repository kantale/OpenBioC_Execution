. ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh
. ${OBC_WORK_PATH}/plink__1_90beta_20190617__1_VARS.sh
. ${OBC_WORK_PATH}/anaconda3__2019_03__1_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__hapmap3_pca__1__1_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__pca_plink_and_plot__1__1_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__pca_plink__1__1_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__pca_plink_and_plot__1__2_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__2d_scatter_of_plink_pca__1__1_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__pca_plink_and_plot__1__3_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__hapmap3_pca__1__2_VARS.sh
. ${OBC_WORK_PATH}/obc_functions.sh
REPORT output__plot__hapmap3_pca__1 ${output__plot__hapmap3_pca__1} OUTPUT_VARIABLE 


OBC_REPORT_TGZ=${OBC_WORK_PATH}/${OBC_NICE_ID}.tgz

#echo "RUNNING: "
#echo "tar zcvf ${OBC_REPORT_TGZ} -C ${OBC_WORK_PATH} ${OBC_NICE_ID}.html ${OBC_NICE_ID}/"

tar zcvf ${OBC_REPORT_TGZ} -C ${OBC_WORK_PATH} ${OBC_NICE_ID}.html ${OBC_NICE_ID}/

echo "{\"output__plot__hapmap3_pca__1\": \"${output__plot__hapmap3_pca__1}\"}"
