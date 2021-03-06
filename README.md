# Rosetta interface design
This repository provides simple to use basic Rosetta script examples. To use this protocols please follow the instructions below. 

Initial instructions:<br/>
1. Copy the git repository to your local machine:<br/>
	> git clone git@github.com:Arielbs/precisionMaterialsDesign.git <br/>
2. Update the .env file with the correct rosetta root:<br/>
	> cd precisionMaterialsDesig <br/>
	> vi .env <br/>
change the first line according to the correct rosetta root on your machine, for example: <br/>
  rosettaROOT: /home/arielbs10/programs/rosetta <br/>

Example 1: interface layer design. the layer design protocol is detailed in (https://www.rosettacommons.org/docs/latest/scripting_documentation/RosettaScripts/TaskOperations/taskoperations_pages/LayerDesignOperation) 
This is a simple to use flavour for the layer design selection of interfacing region between chains A and B. 
For this example a subset of the model of Acetohydroxyacid Synthase (6vz8) was downloaded to the input folder from RCSB (ref: 6vz8, 6u9d: Lonhienne, T., Low, Y.S., Garcia, M.D., Croll, T., Gao, Y., Wang, Q., Brillault, L., Williams, C.M., Fraser, J.A., McGeary, R.P., West, N.P., Landsberg, M.J., Rao, Z., Schenk, G., Guddat, L.W. (2020) Structures of fungal and plant acetohydroxyacid synthases. Nature 586: 317-321).  

To run the protocol as is from the project root folder use the following command: <br/>
 > sh job1LD.sh <br/>
Silent and log files can be found in ./output_intLD/6vz8_AB_01/* <br/>
To obtain the pdb file run the following command: <br/>
 > jobExtractAll.sh output_intLD/6vz8_AB_01/6vz8_AB_01.silent <br/>

Layers residue id can be found in the log file by searching for the layer_label (i.e. core_label, boundary_label, and surface_layer) 
The pymol session (.pse file) prepared in the output_LD results folder was genrated by the following commands: <br/>
1. load *.pdb file to a pymol session 
2. copy the lanels selection lines from the log file to the pymol cmd to select layers.
3. color by layers.
4. translate chain B 20 Angstrom (translate [20,0,0], chain B)
5. show surface


Example 2: protein interface explicit solvation (https://new.rosettacommons.org/docs/latest/scripting_documentation/RosettaScripts/Movers/ExplicitWaterMover)
Based on (Ryan E. Pavlovicz, Hahnbeom Park, Frank DiMaio, doi: https://doi.org/10.1101/618603https://www.biorxiv.org/content/10.1101/618603v2)

To run the protocol as is from the project root folder use the following command: <br/>
 > sh job1H2O.sh <br/>
Silent and log files can be found in ./output_intH2O/1AY7ns_01/* <br/>
To obtain the pdb file run the following command: <br/>
 > jobExtractAll.sh ./output_intH2O/1AY7ns_01/1AY7ns_01.silent <br/> 






