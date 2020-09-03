
class: CommandLineTool
cwlVersion: v1.0

baseCommand: ["bash", "anaconda3__2019_03__1.sh"]

requirements:
   InitialWorkDirRequirement:
      listing:
         - class: File
           location: "anaconda3__2019_03__1.sh"
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
   plink__1_90beta_20190617__1:
      type: File
   OBC_TOOL_PATH: string
   OBC_DATA_PATH: string
   OBC_WORK_PATH: string



outputs: 
   anaconda3__2019_03__1:
      type: stdout

