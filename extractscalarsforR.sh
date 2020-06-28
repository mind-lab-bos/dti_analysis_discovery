#!/bin/bash
#SBATCH --partition=short
#SBATCH --job-name=job.DIRTOANALYZE
#SBATCH --time=00:10:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --output=fslstats.output
#SBATCH --error=fslstats.error

module load fsl

source /shared/centos7/fsl/6.0.0/etc/fslconf/fsl.sh

export FSLOUTPUTTYPE=NIFTI_GZ

#subject name variable

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

subjects=` ls -d sub???_1`
tracts=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/tractsvariable)
values=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/valuesvariable_fullname)
scalars=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/scalarsvariable)

#Create the header line
echo "-PartID" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
for tract in $tracts
do
	for value in $values
	do
		echo "${tract}_FA_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
	done	
done

for tract in $tracts
do
	for value in $values
	do
		echo "${tract}_MO_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
	done	
done

for tract in $tracts
do
	for value in $values
	do					
		echo "${tract}_RD_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
	done	
done
	
for tract in $tracts
do
	for value in $values
	do
		echo "${tract}_MD_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
	done	
done
	
for tract in $tracts
do
	for value in $values
	do
		echo "${tract}_L1_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
	done	
done	

#Write scalars into file
for subject in $subjects
do
	echo "Now computing fslstats for $subject"
	#Write the subject name with "-" before each new subject
	echo "-$subject" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
	for scalar in $scalars
	do	
		for tract in $tracts
		do
			#Mask the tract onto the scalar file using -k, write the mean (-M), standard deviation (-S), and volume (-V) to the tractforR.txt file
			fslstats ${subject}/${subject}_dfit_${scalar}.nii.gz -k ${subject}/probtrackx/averaged/${tract}_fdt_paths_thrP10_avg.nii.gz -M -S -V >> /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
		done	
	done
done

#Since the subject name/tract/scalar and the values from fslstats are in separate lines, remove all the new lines and replace with a space to a new temporary file  
tr '\n' ' ' < /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/temptractforR.txt
# In the temp file, replace each "-" with a new line and write it to the final tractforR.txt file
tr -s '-' '\n' < /work/mindlab/Projects/fitkids2mus/probtrackx/temptractforR.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/tractforR.txt
# Remove all the temporary subject files, we just want the final tractforR.txt file
rm /work/mindlab/Projects/fitkids2mus/probtrackx/temptractforR.txt

echo "finished."
