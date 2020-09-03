. ${OBC_WORK_PATH}/hapmap3__broad__1_VARS.sh
. ${OBC_WORK_PATH}/plink__1_90beta_20190617__1_VARS.sh
. ${OBC_WORK_PATH}/anaconda3__2019_03__1_VARS.sh
. ${OBC_WORK_PATH}/WDycJ_inputs.sh
. ${OBC_WORK_PATH}/step__main_step__hapmap3_pca__1__1_VARS.sh
. ${OBC_WORK_PATH}/step__main_step__pca_plink_and_plot__1__2_VARS.sh
. ${OBC_WORK_PATH}/obc_functions.sh
OBC_START=$(eval "declare")
:
# Insert the BASH commands for this step

output__plot__2d_scatter_of_plink_pca__1=${OBC_WORK_PATH}/$(basename ${input__eigenvectors__2d_scatter_of_plink_pca__1}).scatter_plot.pdf

cat > p.py << EOFF

import pandas as pd

fn = "${input__eigenvectors__2d_scatter_of_plink_pca__1}"
df = pd.read_csv(fn, header=None, sep=' ')
ax = df.plot.scatter(x=2, y=3)
fig = ax.figure
fig.savefig("${output__plot__2d_scatter_of_plink_pca__1}")

EOFF

${anaconda3__2019_03__1__path} p.py

REPORT ${output__plot__2d_scatter_of_plink_pca__1} 


OBC_CURRENT=$(eval "declare")
comm -3 <(echo "$OBC_START" | grep -v "_=" | sort) <(echo "$OBC_CURRENT" | grep -v OBC_START | grep -v PIPESTATUS | grep -v "_=" | sort) > ${OBC_WORK_PATH}/step__main_step__2d_scatter_of_plink_pca__1__1_VARS.sh
