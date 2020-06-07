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

# Initialize variables
tractsandROIs=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/tractsandROIsvariable)
nonmusicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/nonmusiciansvariable)
musicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/musiciansvariable)

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

# For each subject, move the ROI to each subject's native space with applywarp, mask the ROI onto the FA image, and fslsplit the masked FA ROI. Nonmusicians and musicians are separated because they are in different variables.
for nonmusician in $nonmusicians
do
	rm -d ${nonmusician}/canonicallymaskedtracts/rightCSTcanonicalleftPCG_leftSTGpcanonicalrightPCG_rightSTGp
	rm -d ${nonmusician}/canonicallymaskedtracts/CC_bodyCC_genuCC_spleniumleftCST
	echo "warping group tracts to individual space for $nonmusician"
	for ROI in $tractsandROIs
	do
		mkdir ${nonmusician}/canonicallymaskedtracts/${ROI}
		applywarp -i /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIs/${ROI}.nii.gz -o ${nonmusician}/canonicallymaskedtracts/${ROI}_native.nii.gz -r ${nonmusician}/${nonmusician}_dfit_FA.nii.gz -w ${nonmusician}/invwarp/${nonmusician}_dfit_FA_invwarp.nii.gz
		fslmaths ${nonmusician}/${nonmusician}_dfit_FA.nii.gz -mas ${nonmusician}/canonicallymaskedtracts/${ROI}_native.nii.gz ${nonmusician}/canonicallymaskedtracts/${ROI}/${ROI}_mask_over_FA.nii.gz
		fslsplit ${nonmusician}/canonicallymaskedtracts/${ROI}/${ROI}_mask_over_FA.nii.gz ${nonmusician}/canonicallymaskedtracts/${ROI}/${ROI} -y 
	done
done 

for musician in $musicians
do
	rm -d ${nonmusician}/canonicallymaskedtracts/rightCSTcanonicalleftPCG_leftSTGpcanonicalrightPCG_rightSTGp
	rm -d ${nonmusician}/canonicallymaskedtracts/CC_bodyCC_genuCC_spleniumleftCST
	echo "warping group tracts to individual space for $musician"
	for ROI in $tractsandROIs
	do
		mkdir ${musician}/canonicallymaskedtracts/${ROI}
		applywarp -i /work/mindlab/Projects/fitkids2mus/probtrackx/canonical_and_new_ROIs/${ROI}.nii.gz -o ${musician}/canonicallymaskedtracts/${ROI}_native.nii.gz -r ${musician}/${musician}_dfit_FA.nii.gz -w ${musician}/invwarp/${musician}_dfit_FA_invwarp.nii.gz
		fslmaths ${musician}/${musician}_dfit_FA.nii.gz -mas ${musician}/canonicallymaskedtracts/${ROI}_native.nii.gz ${musician}/canonicallymaskedtracts/${ROI}/${ROI}_mask_over_FA.nii.gz
		fslsplit ${musician}/canonicallymaskedtracts/${ROI}/${ROI}_mask_over_FA.nii.gz ${musician}/canonicallymaskedtracts/${ROI}/${ROI} -y 
	done
done 

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

# Create headers for the text file containing the stats of the split tracts
echo "Calculating stats for split files"
echo "-PartID" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
echo "pre_play_an_instrument" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt

# Find the mean for each fslsplit ROI (values are separated by $ROI_Mean) and write it to the text file
for nonmusician in $nonmusicians
do
	echo "Now computing fslstats for $nonmusician"
	#Write the subject name with "-" before each new subject
	echo "-$nonmusician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
	echo "nonmusician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
	for ROI in $tractsandROIs
	do	
		echo "${ROI}_Mean" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
		splitfiles=` ls ${nonmusician}/canonicallymaskedtracts/${ROI}/${ROI}????.nii.gz`
		for splitfile in $splitfiles
		do
			fslstats ${splitfile} -M >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
		done	
	done
done

for musician in $musicians
do
	echo "Now computing fslstats for $musician"
	#Write the subject name with "-" before each new subject
	echo "-$musician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
	echo "musician" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
	for ROI in $tractsandROIs
	do	
		echo "${ROI}_Mean" >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
		splitfiles=` ls ${musician}/canonicallymaskedtracts/${ROI}/${ROI}????.nii.gz`
		for splitfile in $splitfiles
		do
			fslstats ${splitfile} -M >> /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt	
		done	
	done
done


#Since the subject name/tract/scalar and the values from fslstats are in separate lines, remove all the new lines and replace with a space to a new temporary file  
tr '\n' ' ' < /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/tempscalars_along_new_ROIs.txt
# In the temp file, replace each "-" with a new line and write it to the final tractforR.txt file
tr -s '-' '\n' < /work/mindlab/Projects/fitkids2mus/probtrackx/tempscalars_along_new_ROIs.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/scalars_along_new_ROIs.txt
rm /work/mindlab/Projects/fitkids2mus/probtrackx/tempscalars_along_new_ROIs.txt