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

#initialize variable for tracts
tracts=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/tractsvariable)
nonmusicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/nonmusiciansvariable)
musicians=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/musiciansvariable)
subjects=` ls -d sub???_1`

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/
mkdir /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts

for subject in $subjects
do
	[ "$subject" = "sub111_1" ] && continue
	echo "$subject FA mask being generated for each tract and added to summed image"
	cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/
	for tract in $tracts
	do
			fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/${tract}_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summed${tract}_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summed${tract}_maskedonFA.nii.gz
	done
done

for nonmusician in $nonmusicians
do
	#exclude sub113_1 because we already used it to initialize
	[ "$nonmusician" = "sub113_1" ] && continue
	echo "$nonmusician FA mask being added to group image"
	cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${nonmusician}/probtrackx/averaged/normalized/binarized
	for tract in $tracts
	do
		fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/${tract}_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusicians${tract}_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusicians${tract}_maskedonFA.nii.gz
	done
done

for musician in $musicians
do
	#exclude sub111_1 because we already used it to initialize
	[ "$musician" = "sub111_1" ] && continue
	echo "$musician FA mask being added to group image"
	cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${musician}/probtrackx/averaged/normalized/binarized
	for tract in $tracts
	do
		fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/${subject}/maskedtractsonFA/normalized/${tract}_maskedonFA_normalized.nii.gz -add /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musicians${tract}_maskedonFA.nii.gz /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musicians${tract}_maskedonFA.nii.gz
	done
done

echo "dividing tracts"	

for tract in $tracts
do
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusicians${tract}_maskedonFA.nii.gz -div 63 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/nonmusicians${tract}_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musicians${tract}_maskedonFA.nii.gz -div 34 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/musicians${tract}_maskedonFA.nii.gz
	fslmaths /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summed${tract}_maskedonFA.nii.gz -div 97 /work/mindlab/Projects/fitkids2mus/probtrackx/average_tracts/FAaverage_tracts/summed${tract}_maskedonFA.nii.gz	
done