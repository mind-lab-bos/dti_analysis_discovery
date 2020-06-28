#!/bin/bash

## Specify the directory of where your scripts "live":
scriptsDir=/home/chen.yae/scripts

## OPTIONAL: create a separate input directory, where all sub???_1 files live, which is separate from the output files. This may be useful for copying stuff back and forth. For now, it is set the same as "workDir":
inputDir=/home/chen.yae/bedpostx

## you can specify a particular directory you want to work in, or leave it as the current 
## directory, with variable "$PWD". 
workDir=/home/chen.yae/bedpostx

#Go to where the files are sitting for bedpostx
cd $inputDir

## Get the list of directories to analyze:
list=` ls -d sub???_1`

cd $workDir

## loop through the list:
for i in $list
do	
	## if an output directory already exists, skip the analysis:
	if [ ! -d $workDir/$i.bedpostX]; then
		## search and replace a pattern within the template.bash script to create
		## a new script that analyzes a particular directory named $i
		sed "s/DIRTOANALYZE/$i/g;s|INPUTDIRPATH|$inputDir|g" $scriptsDir/template.bash > $workDir/submitScript.$i.bash
		sbatch $workDir/submitScript.$i.bash
		sleep 1
	fi
done
