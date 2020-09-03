
class: CommandLineTool
cwlVersion: v1.0

baseCommand: ["bash", "step__main_step__pca_plink_and_plot__1__3.sh"]

requirements:
   InitialWorkDirRequirement:
      listing:
         - class: File
           location: "step__main_step__pca_plink_and_plot__1__3.sh"
   InlineJavascriptRequirement: {} 
   EnvVarRequirement:
       envDef:
         OBC_TOOL_PATH: $(inputs.OBC_TOOL_PATH)
         OBC_DATA_PATH: $(inputs.OBC_DATA_PATH)
         OBC_WORK_PATH: $(inputs.OBC_WORK_PATH)
         OBC_WORKFLOW_NAME: "hapmap3_pca"
         OBC_WORKFLOW_EDIT: "1"
         OBC_NICE_ID: "hapmap3_pca__1"

inputs: 
   step__main_step__2d_scatter_of_plink_pca__1__1:
      type: File
   OBC_TOOL_PATH: string
   OBC_DATA_PATH: string
   OBC_WORK_PATH: string



outputs: 
   step__main_step__pca_plink_and_plot__1__3:
      type: stdout

