# LayerDesign
This repository goal is to provide simple to use basic Rosetta script examples based. To use this protocols please follow the instructions below. 

Initial instructions:
1. Copy the git repository to your local machine:
	>get clone git@github.com:Arielbs/precisionMaterialsDesign.git
2. Update the .env file with the correct rosetta root:
	> cd precisionMaterialsDesig
	> vi .env
change the first line according to the correct rosetta root on your machine, for example:
	> rosettaROOT: /home/arielbs10/programs/rosetta

example 1: interface layer design. the layer design protocol is detailed in (https://www.rosettacommons.org/docs/latest/scripting_documentation/RosettaScripts/TaskOperations/taskoperations_pages/LayerDesignOperation) 
This is a simple to use flavour for the layer design selection of interfacing region between chains A and B. 
For this example a subset of the model of Acetohydroxyacid Synthase (6vz8) was downloaded to the input folder from rcsb.  

To run the protocol as is from the project root folder use the following command:
> sh job1LD.sh 
This would exttract the resulting silent and log files into the output_LD folder. To extact the pdb fiel run:
> jobExtractAll.sh

Layers residue id can be found in the log file. 
The pymol session (.pse file) prepared in the output_LD results folder was genrated by the following commands:
1. load *.pdb file
2. cpoy the lines from the log file to the pymol cmd line to select layers.
3. color by layers.
4. translate chain B by 20 Angstrom.
5. show surface.


