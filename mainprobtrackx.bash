#!/bin/bash

## Specify the directory of where your scripts "live":
scriptsDir=/scratch/chen.yae/scripts

## OPTIONAL: create a separate input directory, where all sub???_1 files live, which is separate from the output files. This may be useful for copying stuff back and forth. For now, it is set the same as "workDir":
inputDir=/scratch/chen.yae/probtrackx/finalbedpostx_withSPSS

## you can specify a particular directory you want to work in, or leave it as the current 
## directory, with variable "$PWD". 
workDir=/scratch/chen.yae/probtrackx/finalbedpostx_withSPSS

cd $inputDir

## Get the list of directories to analyze:
list=` ls -d sub???_1`

cd $workDir

## loop through the list:
for i in $list
do	
	## if an output directory already exists, skip the analysis:
	if [ ! -e $workDir/$i/probtrackx/averaged/rightMTGp_rightSTGp_fdt_paths_thrP10_avg.nii.gz ]; then
		## search and replace a pattern within the template.bash script to create
		## a new script that analyzes a particular directory named $i
		sed "s/DIRTOANALYZE/$i/g;s|INPUTDIRPATH|$inputDir|g" $scriptsDir/templateprobtrackx.sh > $workDir/submitScriptprobtrackx.$i.sh
		sbatch $workDir/submitScriptprobtrackx.$i.sh
		sleep 1
	fi
done
