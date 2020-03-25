#!/bin/bash
#SBATCH -p infiniband
#SBATCH --job-name=job.sub111_1
#SBATCH --time=24:00:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --output=sub111_1.output
#SBATCH --error=sub111_1.error

module load fsl

source /shared/centos7/fsl/6.0.0/etc/fslconf/fsl.sh

export FSLOUTPUTTYPE=NIFTI_GZ

bedpostx sub111_1 -n 2 -w 1 -b 1000
