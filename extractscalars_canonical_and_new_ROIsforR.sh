#!/bin/bash
#SBATCH --partition=short
#SBATCH --job-name=job.DIRTOANALYZE
#SBATCH --time=00:10:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --output=averagebin.output
#SBATCH --error=averagebin.error

module load fsl

source /shared/centos7/fsl/6.0.0/etc/fslconf/fsl.sh

export FSLOUTPUTTYPE=NIFTI_GZ

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

# Initialize variables
tractsandROIs=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/tractsandROIsvariable)
subjects=` ls -d sub???_1`
values=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/valuesvariable_fullname)
scalars=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/scalarsvariable)

#Create the header line
echo "-PartID" >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
for tract in $tractsandROIs
do
	for value in $values
	do
		echo "${tract}_FA_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
	done	
done

for tract in $tractsandROIs
do
	for value in $values
	do
		echo "${tract}_MO_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
	done	
done

for tract in $tractsandROIs
do
	for value in $values
	do					
		echo "${tract}_RD_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
	done	
done
	
for tract in $tractsandROIs
do
	for value in $values
	do
		echo "${tract}_MD_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
	done	
done
	
for tract in $tractsandROIs
do
	for value in $values
	do
		echo "${tract}_L1_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
	done	
done	

#Write scalars into file
for subject in $subjects
do
	echo "Now computing fslstats for $subject"
	#Write the subject name with "-" before each new subject
	echo "-$subject" >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
	for scalar in $scalars
	do	
		for tract in $tractsandROIs
		do
			#Mask the tract onto the scalar file using -k, write the mean (-M), standard deviation (-S), and volume (-V) canonical_and_new_ROIsforR.txt
			fslstats ${subject}/${subject}_dfit_${scalar}.nii.gz -k ${subject}/canonicallymaskedtracts/${tract}_native.nii.gz -M -S -V >> /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
		done	
	done
done

#Since the subject name/tract/scalar and the values from fslstats are in separate lines, remove all the new lines and replace with a space to a new temporary file  
tr '\n' ' ' < /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/tempcanonical_and_new_ROIsforR.txt
# In the temp file, replace each "-" with a new line and write it to the final canonical_and_new_ROIsforR.txt
tr -s '-' '\n' < /work/mindlab/Projects/fitkids2mus/probtrackx/tempcanonical_and_new_ROIsforR.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIsforR.txt
# Remove all the temporary subject files, we just want the final canonical_and_new_ROIsforR.txt
rm /work/mindlab/Projects/fitkids2mus/probtrackx/tempcanonical_and_new_ROIsforR.txt

echo "finished."
