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

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

echo "initializing variables"
#initialize variable for tracts
nonmusicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/nonmusiciansvariable)
musicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/musiciansvariable)
subjects=` ls -d sub???_1`

echo "initializing first summed musicians and summed subject"
# initiate the first subject as the summed binarized file in the correct location. In this case, we want sub111_1 as the first "summed" and "musicians"
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/leftMTGp_leftSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftMTGp_leftSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/leftPCG_leftMTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftMTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/leftPCG_leftSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/rightMTGp_rightSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightMTGp_rightSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/rightPCG_rightMTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightMTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/rightPCG_rightSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightSTGp_maskedonFA.nii.gz

cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/leftMTGp_leftSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftMTGp_leftSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/leftPCG_leftMTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftMTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/leftPCG_leftSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/rightMTGp_rightSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightMTGp_rightSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/rightPCG_rightMTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightMTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub111_1/maskedtractsonFA/normalized/rightPCG_rightSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightSTGp_maskedonFA.nii.gz

echo "initializing first summed nonmusicians subject"
# initiate the first subject as the summed binarized file for sub113_1 as "nonmusicians"
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/maskedtractsonFA/normalized/leftMTGp_leftSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftMTGp_leftSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/maskedtractsonFA/normalized/leftPCG_leftMTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftMTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/maskedtractsonFA/normalized/leftPCG_leftSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/maskedtractsonFA/normalized/rightMTGp_rightSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightMTGp_rightSTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/maskedtractsonFA/normalized/rightPCG_rightMTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightMTGp_maskedonFA.nii.gz
cp /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/sub113_1/maskedtractsonFA/normalized/rightPCG_rightSTGp_maskedonFA_normalized.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightSTGp_maskedonFA.nii.gz

# These subject names don't include the very first subject. The first subject was manually copied from their normalized folders and thresholded/binarized to initiate the loops (sub111_1 for s and musicians, sub 113_1 for nonmusicians)

echo "making summed FA tracts"
for subject in $subjects
do
	[ "$subject" = "sub111_1" ] && continue
	echo "$subject FA mask being added to summed image"
	cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/leftMTGp_leftSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftMTGp_leftSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftMTGp_leftSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/leftPCG_leftMTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftMTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftMTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/leftPCG_leftSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/rightMTGp_rightSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightMTGp_rightSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightMTGp_rightSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/rightPCG_rightMTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightMTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightMTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/rightPCG_rightSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightSTGp_maskedonFA.nii.gz
done

for nonmusician in $nonmusicians
do
	[ "$nonmusician" = "sub113_1" ] && continue
	echo "$nonmusician FA mask being added to group nonmusicians image"
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/maskedtractsonFA/normalized/leftMTGp_leftSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftMTGp_leftSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftMTGp_leftSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/maskedtractsonFA/normalized/leftPCG_leftMTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftMTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftMTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/maskedtractsonFA/normalized/leftPCG_leftSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/maskedtractsonFA/normalized/rightMTGp_rightSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightMTGp_rightSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightMTGp_rightSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/maskedtractsonFA/normalized/rightPCG_rightMTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightMTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightMTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/maskedtractsonFA/normalized/rightPCG_rightSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightSTGp_maskedonFA.nii.gz
done

for musician in $musicians
do
	#exclude sub111_1 because we already used it to initialize
	[ "$musician" = "sub111_1" ] && continue
	echo "$musician FA mask being added to group musicians image"
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/maskedtractsonFA/normalized/leftMTGp_leftSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftMTGp_leftSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftMTGp_leftSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/maskedtractsonFA/normalized/leftPCG_leftMTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftMTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftMTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/maskedtractsonFA/normalized/leftPCG_leftSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/maskedtractsonFA/normalized/rightMTGp_rightSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightMTGp_rightSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightMTGp_rightSTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/maskedtractsonFA/normalized/rightPCG_rightMTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightMTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightMTGp_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/maskedtractsonFA/normalized/rightPCG_rightSTGp_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightSTGp_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightSTGp_maskedonFA.nii.gz
done

echo "dividing tracts"
	
mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/
	
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftMTGp_leftSTGp_maskedonFA.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/nonmusiciansaverageleftMTGp_leftSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftMTGp_maskedonFA.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/nonmusiciansaverageleftPCG_leftMTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansleftPCG_leftSTGp_maskedonFA.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/nonmusiciansaverageleftPCG_leftSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightMTGp_rightSTGp_maskedonFA.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/nonmusiciansaveragerightMTGp_rightSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightMTGp_maskedonFA.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/nonmusiciansaveragerightPCG_rightMTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusiciansrightPCG_rightSTGp_maskedonFA.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/nonmusiciansaveragerightPCG_rightSTGp_maskedonFA.nii.gz
	
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftMTGp_leftSTGp_maskedonFA.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/musiciansaverageleftMTGp_leftSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftMTGp_maskedonFA.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/musiciansaverageleftPCG_leftMTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansleftPCG_leftSTGp_maskedonFA.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/musiciansaverageleftPCG_leftSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightMTGp_rightSTGp_maskedonFA.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/musiciansaveragerightMTGp_rightSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightMTGp_maskedonFA.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/musiciansaveragerightPCG_rightMTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musiciansrightPCG_rightSTGp_maskedonFA.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/musiciansaveragerightPCG_rightSTGp_maskedonFA.nii.gz
	
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftMTGp_leftSTGp_maskedonFA.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/averageleftMTGp_leftSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftMTGp_maskedonFA.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/averageleftPCG_leftMTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedleftPCG_leftSTGp_maskedonFA.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/averageleftPCG_leftSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightMTGp_rightSTGp_maskedonFA.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/averagerightMTGp_rightSTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightMTGp_maskedonFA.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/averagerightPCG_rightMTGp_maskedonFA.nii.gz
fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summedrightPCG_rightSTGp_maskedonFA.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/finalaverage/averagerightPCG_rightSTGp_maskedonFA.nii.gz
