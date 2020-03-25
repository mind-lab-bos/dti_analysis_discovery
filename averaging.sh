#!/bin/bash
#SBATCH --partition=short
#SBATCH --job-name=job.DIRTOANALYZE
#SBATCH --time=00:10:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --output=averaging.output
#SBATCH --error=averaging.error

module load fsl

source /shared/centos7/fsl/6.0.0/etc/fslconf/fsl.sh

export FSLOUTPUTTYPE=NIFTI_GZ

#subject name variable

cd /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/

# these subject names don't include the very first subject. The first subject was manually copied from their normalized folders and renamed to initiate the loops
nonmusicians="sub118_1" "sub132_1" "sub142_1" "sub145_1" "sub150_1" "sub159_1" "sub161_1" "sub178_1" "sub179_1" "sub180_1" "sub193_1" "sub196_1" "sub197_1" "sub199_1" "sub200_1" "sub220_1" "sub239_1" "sub240_1" "sub241_1" "sub242_1" "sub243_1" "sub244_1" "sub245_1" "sub248_1" "sub249_1" "sub255_1" "sub258_1" "sub261_1" "sub271_1" "sub283_1" "sub288_1" "sub292_1" "sub303_1" "sub316_1" "sub339_1" "sub341_1" "sub343_1" "sub350_1" "sub354_1" "sub359_1" "sub369_1" "sub370_1" "sub373_1"  "sub375_1" "sub382_1" "sub393_1" "sub398_1" "sub403_1" "sub411_1" "sub446_1" "sub463_1" "sub468_1" "sub470_1" "sub491_1" "sub498_1" "sub517_1" "sub525_1" "sub529_1" "sub534_1" "sub544_1" "sub547_1" "sub550_1"
musicians="sub112_1" "sub117_1" "sub139_1" "sub176_1" "sub188_1" "sub231_1" "sub233_1" "sub260_1" "sub262_1" "sub274_1" "sub281_1" "sub286_1" "sub323_1" "sub335_1" "sub344_1" "sub351_1" "sub356_1" "sub360_1" "sub388_1" "sub389_1" "sub426_1" "sub439_1" "sub445_1" "sub447_1" "sub448_1" "sub459_1" "sub482_1" "sub494_1" "sub496_1" "sub501_1" "sub506_1" "sub507_1" "sub514_1"
s=` ls -d sub???_1`

#the first subject was moved to a separate folder within the probtrackx folder called failed_or_averaged since we don't want it included in $s after manually adding it already
for subject in $s
do
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$subject/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/summedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/summedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$subject/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$subject/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$subject/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$subject/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$subject/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz	/scratch/chen.yae/probtrackx/average_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz
	echo $subject
done

for nonmusician in $nonmusicians
do
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$nonmusician/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$nonmusician/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$nonmusician/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$nonmusician/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$nonmusician/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$nonmusician/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz	/scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz
	echo $nonmusician
done

for musician in $musicians
do
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$musician/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$musician/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$musician/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$musician/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$musician/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz
	fslmaths /scratch/chen.yae/probtrackx/finalbedpostx_withSPSS/$musician/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -add /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz	/scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz
	echo $musician	
done

	
fslmaths /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz -div 63 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/nonmusiciansaveragerightPCG_rightSTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz -div 63 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/nonmusiciansaveragerightPCG_rightMTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz -div 63 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/nonmusiciansaveragerightMTGp_right_STGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz -div 63 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/nonmusiciansaverageleftPCG_leftSTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz -div 63 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/nonmusiciansaverageleftPCG_leftMTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/nonmusicianssummedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -div 63 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/nonmusiciansaveragerightMTGp_leftSTGp

fslmaths /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz -div 34 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/musiciansaveragerightPCG_rightSTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz -div 34 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/musiciansaveragerightPCG_rightMTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/musicianssummedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz -div 34 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/musiciansaveragerightMTGp_right_STGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz -div 34 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/musiciansaverageleftPCG_leftSTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz -div 34 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/musiciansaverageleftPCG_leftMTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/musicianssummedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -div 34 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/musiciansaveragerightMTGp_leftSTGp

fslmaths /scratch/chen.yae/probtrackx/average_tracts/summedrightPCG_rightSTGp_thrP10_avg_norm.nii.gz -div 97 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/averagerightPCG_rightSTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/summedrightPCG_rightMTGp_thrP10_avg_norm.nii.gz -div 97 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/averagerightPCG_rightMTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/summedrightMTGp_right_STGp_thrP10_avg_norm.nii.gz -div 97 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/averagerightMTGp_right_STGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/summedleftPCG_leftSTGp_thrP10_avg_norm.nii.gz -div 97 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/averageleftPCG_leftSTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/summedleftPCG_leftMTGp_thrP10_avg_norm.nii.gz -div 97 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/averageleftPCG_leftMTGp
fslmaths /scratch/chen.yae/probtrackx/average_tracts/summedleftMTGp_leftSTGp_thrP10_avg_norm.nii.gz -div 97 /scratch/chen.yae/probtrackx/average_tracts/finalaverage_tracts/averagerightMTGp_leftSTGp

