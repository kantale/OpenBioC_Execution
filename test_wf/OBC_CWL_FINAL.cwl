
class: CommandLineTool
cwlVersion: v1.0

baseCommand: ["bash", "OBC_CWL_FINAL.sh"]

requirements:
   InitialWorkDirRequirement:
      listing:
         - class: File
           location: "OBC_CWL_FINAL.sh"
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
   step__main_step__hapmap3_pca__1__2:
      type: File
   OBC_TOOL_PATH: string
   OBC_DATA_PATH: string
   OBC_WORK_PATH: string

stdout: cwl.output.json

outputs: 
   output__plot__hapmap3_pca__1:
      type: string
      outputBinding:
         glob: cwl.output.json
         loadContents: true
         outputEval: $(JSON.parse(self[0].contents).output__plot__hapmap3_pca__1)



