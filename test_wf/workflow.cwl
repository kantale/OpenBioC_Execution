#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow

inputs: 
   OBC_TOOL_PATH: string
   OBC_DATA_PATH: string
   OBC_WORK_PATH: string

outputs: 
   output__plot__hapmap3_pca__1:
      type: string
      outputSource: OBC_CWL_FINAL/output__plot__hapmap3_pca__1



steps:
   hapmap3__broad__1:
      run: hapmap3__broad__1.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         OBC_CWL_INIT: OBC_CWL_INIT/OBC_CWL_INIT

      out: [hapmap3__broad__1]


   plink__1_90beta_20190617__1:
      run: plink__1_90beta_20190617__1.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         hapmap3__broad__1: hapmap3__broad__1/hapmap3__broad__1

      out: [plink__1_90beta_20190617__1]


   OBC_CWL_INIT:
      run: OBC_CWL_INIT.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
      out: [OBC_CWL_INIT]


   anaconda3__2019_03__1:
      run: anaconda3__2019_03__1.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         plink__1_90beta_20190617__1: plink__1_90beta_20190617__1/plink__1_90beta_20190617__1

      out: [anaconda3__2019_03__1]


   step__main_step__hapmap3_pca__1__1:
      run: step__main_step__hapmap3_pca__1__1.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         anaconda3__2019_03__1: anaconda3__2019_03__1/anaconda3__2019_03__1

      out: [step__main_step__hapmap3_pca__1__1]


   step__main_step__pca_plink_and_plot__1__1:
      run: step__main_step__pca_plink_and_plot__1__1.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         step__main_step__hapmap3_pca__1__1: step__main_step__hapmap3_pca__1__1/step__main_step__hapmap3_pca__1__1

      out: [step__main_step__pca_plink_and_plot__1__1]


   step__main_step__pca_plink__1__1:
      run: step__main_step__pca_plink__1__1.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         step__main_step__pca_plink_and_plot__1__1: step__main_step__pca_plink_and_plot__1__1/step__main_step__pca_plink_and_plot__1__1

      out: [step__main_step__pca_plink__1__1]


   step__main_step__pca_plink_and_plot__1__2:
      run: step__main_step__pca_plink_and_plot__1__2.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         step__main_step__pca_plink__1__1: step__main_step__pca_plink__1__1/step__main_step__pca_plink__1__1

      out: [step__main_step__pca_plink_and_plot__1__2]


   step__main_step__2d_scatter_of_plink_pca__1__1:
      run: step__main_step__2d_scatter_of_plink_pca__1__1.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         step__main_step__pca_plink_and_plot__1__2: step__main_step__pca_plink_and_plot__1__2/step__main_step__pca_plink_and_plot__1__2

      out: [step__main_step__2d_scatter_of_plink_pca__1__1]


   step__main_step__pca_plink_and_plot__1__3:
      run: step__main_step__pca_plink_and_plot__1__3.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         step__main_step__2d_scatter_of_plink_pca__1__1: step__main_step__2d_scatter_of_plink_pca__1__1/step__main_step__2d_scatter_of_plink_pca__1__1

      out: [step__main_step__pca_plink_and_plot__1__3]


   step__main_step__hapmap3_pca__1__2:
      run: step__main_step__hapmap3_pca__1__2.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         step__main_step__pca_plink_and_plot__1__3: step__main_step__pca_plink_and_plot__1__3/step__main_step__pca_plink_and_plot__1__3

      out: [step__main_step__hapmap3_pca__1__2]


   OBC_CWL_FINAL:
      run: OBC_CWL_FINAL.cwl
      in: 
         OBC_TOOL_PATH: OBC_TOOL_PATH
         OBC_DATA_PATH: OBC_DATA_PATH
         OBC_WORK_PATH: OBC_WORK_PATH
         step__main_step__hapmap3_pca__1__2: step__main_step__hapmap3_pca__1__2/step__main_step__hapmap3_pca__1__2

      out: [output__plot__hapmap3_pca__1]



