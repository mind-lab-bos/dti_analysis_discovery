#!/bin/bash
#SBATCH -p infiniband
#SBATCH --job-name=job.DIRTOANALYZE
#SBATCH --time=24:00:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --output=DIRTOANALYZE.output
#SBATCH --error=DIRTOANALYZE.error

module load fsl

source /shared/centos7/fsl/6.0.0/etc/fslconf/fsl.sh

export FSLOUTPUTTYPE=NIFTI_GZ

bedpostx INPUTDIRPATH/DIRTOANALYZE -n 2 -w 1 -b 1000
