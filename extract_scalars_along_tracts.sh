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
tracts=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/tractsvariable)
nonmusicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/nonmusiciansvariable)
musicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/musiciansvariable)
all_subjects=` ls -d sub???_1`
values=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/valuesvariable)

cd /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts

# Create the group canonical tracts by thresholding the summed group tract and binarizing the thresholded tract
echo "creating group tracts"
for tract in $tracts
do 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/nonmusicianssummed${tract}_thrP10_avg_norm.nii.gz -thrP 10 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/nonmusicians${tract}_group_bin_thrP10.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/nonmusicians${tract}_group_bin_thrP10.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/nonmusicians${tract}_group_bin_thrP10.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/musicianssummed${tract}_thrP10_avg_norm.nii.gz -thrP 10 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/musicians${tract}_group_bin_thrP10.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/musicians${tract}_group_bin_thrP10.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/musicians${tract}_group_bin_thrP10.nii.gz
done

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

# For each subject, move the group canonical tracts to each subject's native space with applywarp, mask the canonical tract onto the FA image, and fslsplit the masked FA tract. Nonmusicians and musicians are separated because they are in different variables.
for nonmusician in $nonmusicians
do
	echo "warping group tracts to individual space for $nonmusician"
	for tract in $tracts
	do
		mkdir ${nonmusician}/canonicallymaskedtracts
		mkdir ${nonmusician}/canonicallymaskedtracts/${tract}
		applywarp -i /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/nonmusicians${tract}_group_bin_thrP10.nii.gz -o ${nonmusician}/canonicallymaskedtracts/${tract}_canonical_native.nii.gz -r ${nonmusician}/${nonmusician}_dfit_FA.nii.gz -w ${nonmusician}/invwarp/${nonmusician}_dfit_FA_invwarp.nii.gz
		fslmaths ${nonmusician}/${nonmusician}_dfit_FA.nii.gz -mas ${nonmusician}/canonicallymaskedtracts/${tract}_canonical_native.nii.gz ${nonmusician}/canonicallymaskedtracts/${tract}/${tract}_maskedbygroup.nii.gz
		fslsplit ${nonmusician}/canonicallymaskedtracts/${tract}/${tract}_maskedbygroup.nii.gz ${nonmusician}/canonicallymaskedtracts/${tract}/${tract} -y 
	done
done 

#Do the same for musicians and nonmusicians
for musician in $musicians
do
	echo "warping group tracts to individual space for $musician"
	for tract in $tracts
	do
		mkdir ${musician}/canonicallymaskedtracts
		mkdir ${musician}/canonicallymaskedtracts/${tract}
		applywarp -i /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedgrouptracts/nonmusicians${tract}_group_bin_thrP10.nii.gz -o ${musician}/canonicallymaskedtracts/${tract}_canonical_native.nii.gz -r ${musician}/${musician}_dfit_FA.nii.gz -w ${musician}/invwarp/${musician}_dfit_FA_invwarp.nii.gz
		fslmaths ${musician}/${musician}_dfit_FA.nii.gz -mas ${musician}/canonicallymaskedtracts/${tract}_canonical_native.nii.gz ${musician}/canonicallymaskedtracts/${tract}/${tract}_maskedbygroup.nii.gz
		fslsplit ${musician}/canonicallymaskedtracts/${tract}/${tract}_maskedbygroup.nii.gz ${musician}/canonicallymaskedtracts/${tract}/${tract} -y 
	done
done 

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

# Create headers for the text file containing the stats of the split tracts
echo "Calculating stats for split files"
echo "-PartID" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
echo "pre_play_an_instrument" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
for tract in $tracts
do
	for splitfile in $splitfiles
	do
		echo "${splitfile}_FA_${value}" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
	done	
done

# Find the mean, SD, and volume for each fslsplit tract (values are separated by *) and write it to the text file
for nonmusician in $nonmusicians
do
	echo "Now computing fslstats for $nonmusician"
	#Write the subject name with "-" before each new subject
	echo "-$nonmusician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
	echo "nonmusician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
	for tract in $tracts
	do	
		echo "$tract" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
		splitfiles=` ls ${nonmusician}/canonicallymaskedtracts/${tract}/${tract}????.nii.gz`
		for value in $values
		do
			echo "*" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
			for splitfile in $splitfiles
			do
				fslstats ${splitfile} -${value} >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
			done	
		done	
	done
done

for musician in $musicians
do
	echo "Now computing fslstats for $musician"
	#Write the subject name with "-" before each new subject
	echo "-$musician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
	echo "musician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
	for tract in $tracts
	do	
		echo "$tract" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
		splitfiles=` ls ${musician}/canonicallymaskedtracts/${tract}/${tract}????.nii.gz`
		for value in $values
		do
			echo "*" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
			for splitfile in $splitfiles
			do
				fslstats ${splitfile} -${value} >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
			done	
		done	
	done
done


#Since the subject name/tract/scalar and the values from fslstats are in separate lines, remove all the new lines and replace with a space to a new temporary file  
tr '\n' ' ' < /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/tempscalars_along_tracts.txt
# In the temp file, replace each "-" with a new line and write it to the final tractforR.txt file
tr -s '-' '\n' < /work/mindlab/Projects/fitkids2mus/probtrackx/tempscalars_along_tracts.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_tracts.txt
