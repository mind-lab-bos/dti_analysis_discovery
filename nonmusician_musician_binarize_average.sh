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

#subject name variable

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

nonmusicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/nonmusiciansvariable)
musicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/musiciansvariable)

echo $nonmusicians

for nonmusician in $nonmusicians
do
	
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
	
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/rightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm_bin.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized/leftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/binarizedaverage_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm_bin.nii.gz
	echo $musician
done