#!/bin/bash
#SBATCH --partition=short
#SBATCH --job-name=job.DIRTOANALYZE
#SBATCH --time=00:10:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --output=averagebin.output
#SBATCH --error=averagebin.error

module load fsl/6.0.0

source /shared/centos7/fsl/6.0.0/etc/fslconf/fsl.sh

export FSLOUTPUTTYPE=NIFTI_GZ

#subject name variable

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts

# initiate the first subject as the summed binarized file in the correct location. In this case, we want sub111_1 as the first "s" and "musicians"

mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz  /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz

# initiate the first subject as the summed binarized file for sub113_1 as "nonmusicians"
mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz 
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz

# These subject names don't include the very first subject. The first subject was manually copied from their normalized folders and thresholded/binarized to initiate the loops (sub111_1 for s and musicians, sub 113_1 for nonmusicians)
nonmusicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/nonmusiciansvariable)
musicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/musiciansvariable)
s=` ls -d sub???_1`

# Now we can threshold and binarize the rest of the files for each group and add them to the initialized binarized, thresholded files.
for subject in $s
do
	[ "$subject" = "sub111_1" ] && continue
	mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz

	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz
	echo $subject
done

for nonmusician in $nonmusicians
do
	[ "$nonmusician" = "sub113_1" ] && continue
	mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz

	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz
	echo $nonmusician
done


for musician in $musicians
do
	[ "$musician" = "sub111_1" ] && continue
	mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz 
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -bin /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz

	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz
	echo $musician
done

mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/nonmusiciansbinarizedaveragerightPCG_rightSTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/nonmusiciansbinarizedaveragerightPCG_rightMTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/nonmusiciansbinarizedaveragerightMTGp_right_STGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/nonmusiciansbinarizedaverageleftPCG_leftSTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/nonmusiciansbinarizedaverageleftPCG_leftMTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/nonmusicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/nonmusiciansbinarizedaverageleftMTGp_leftSTGp

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/musiciansbinarizedaveragerightPCG_rightSTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/musiciansbinarizedaveragerightPCG_rightMTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/musiciansbinarizedaveragerightMTGp_right_STGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/musiciansbinarizedaverageleftPCG_leftSTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/musiciansbinarizedaverageleftPCG_leftMTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/musiciansbinarizedaverageleftMTGp_leftSTGp

fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/binarizedaveragerightPCG_rightSTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/binarizedaveragerightPCG_rightMTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/binarizedaveragerightMTGp_right_STGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/binarizedaverageleftPCG_leftSTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/binarizedaverageleftPCG_leftMTGp
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/finalaveragebinarized_tracts/binarizedaverageleftMTGp_leftSTGp