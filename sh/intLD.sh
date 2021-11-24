
xml=$1
nstruct=$2
basename=$3
local_path=$4
jobID=$5


echo xml: $xml 
echo n: $nstruct
echo basename: $basename 
echo Local path=$local_path
echo Interface design for scaffold $basename
pdbInPath=${local_path}/input/${basename}.pdb
echo Path to input scaffold: ${pdbInPath}

projOutputPath=${local_path}/output_${xml}
if [ ! -d "$projOutputPath" ]; then
   mkdir $projOutputPath
fi
echo Project output folder is $projOutputPath

output_path=`echo ${projOutputPath}/${basename}_${jobID}`
if [ ! -d "$output_path" ]; then
   mkdir $output_path
fi
echo Output folder is $output_path

path2xml=${local_path}/xml/${xml}.xml
echo Design using script at $path2xml
path2flags=${local_path}/utils/intDesign.flags


rosettaRoot="$(grep 'rosettaROOT' ${local_path}/.env | cut -d\   -f2)"
RoesttaExe=${rosettaRoot}/main/source/bin/rosetta_scripts.static.linuxgccrelease
p2RosettaData=${rosettaRoot}/main/database/
echo rosettaRoot: $rosettaRoot

${RoesttaExe} \
    @utils/intDesign.flags \
 -database  ${p2RosettaData} \
 -s ${pdbInPath} \
 -in::file::native ${pdbInPath} \
 -parser:protocol ${path2xml} \
 -nstruct ${nstruct} \
 -beta \
 -mute core.conform:qation.symmetry.SymmData core.conformation.SymmetryInfo \
 -parser:script_vars outPath=${output_path} basename=${basename} \
 -out:prefix  \
 -renumber_pdb 1 \
 -out::suffix  _D \
 -out::path::all ${output_path}/ \
 -ignore_zero_occupancy false \
 -out:file:silent ${output_path}/${basename}_${jobID}.silent  -out:file:silent_struct_type binary \
 -overwrite 1 > ${output_path}/${basename}.log


