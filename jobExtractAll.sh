localPath=`pwd`
rosettaRoot="$(grep 'rosettaROOT' ${localPath}/.env | cut -d\   -f2)"
${rosettaRoot}/main/source/bin/extract_pdbs.static.linuxgccrelease -database ${rosettaRoot}/main/database -in:file:silent $1 -in:file:silent_struct_type binary -renumber_pdb 1 
