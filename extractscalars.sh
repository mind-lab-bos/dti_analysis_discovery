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

#subject name variable and tract variable is initialized

cd /work/mindlab/Projects/fitkids2mus/probtrackx/finalbedpostx_withSPSS/

s=` ls -d sub???_1`
t=$(cat /work/mindlab/Projects/fitkids2mus/probtrackx/scripts/tractsvariable)

for subject in $s
do
	echo "Now computing fslstats for $subject"
	#Write the subject name with "-" before each new subject
	echo "-$subject" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
	for tract in $t
	do	
		#Write the tract and scalar being calculated to the tract.txt file
		echo "$tract FA" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		#Mask the tract onto the scalar file using -k, write the mean (-M), standard deviation (-S), and volume (-V) to the tract.txt file
		fslstats ${subject}/probtrackx/averaged/${tract}_fdt_paths_thrP10_avg.nii.gz -k ${subject}/${subject}_dfit_FA.nii.gz -M -S -V >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		#Write the subject name, tract, and scalar, keep calculating values for each scalar and write it to tract.txt
		echo "$subject $tract MO" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		fslstats ${subject}/probtrackx/averaged/${tract}_fdt_paths_thrP10_avg.nii.gz -k ${subject}/${subject}_dfit_MO.nii.gz -M -S -V >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		echo "$subject $tract RD" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		fslstats ${subject}/probtrackx/averaged/${tract}_fdt_paths_thrP10_avg.nii.gz -k ${subject}/${subject}_dfit_RD.nii.gz -M -S -V >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		echo "$subject $tract MD" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		fslstats ${subject}/probtrackx/averaged/${tract}_fdt_paths_thrP10_avg.nii.gz -k ${subject}/${subject}_dfit_MD.nii.gz -M -S -V >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		echo "$subject $tract L1" >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
		fslstats ${subject}/probtrackx/averaged/${tract}_fdt_paths_thrP10_avg.nii.gz -k ${subject}/${subject}_dfit_L1.nii.gz -M -S -V >> /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
	done
done

#Since the subject name/tract/scalar and the values from fslstats are in separate lines, remove all the new lines and replace with a space to a new temporary file  
tr '\n' ' ' < /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/temptract.txt
# In the temp file, replace each "-" with a new line and write it to the final tract.txt file
tr -s '-' '\n' < /work/mindlab/Projects/fitkids2mus/probtrackx/temptract.txt > /work/mindlab/Projects/fitkids2mus/probtrackx/tract.txt
# Remove all the temporary subject files, we just want the final tract.txt file
rm /work/mindlab/Projects/fitkids2mus/probtrackx/temptract.txt

echo "finished."
