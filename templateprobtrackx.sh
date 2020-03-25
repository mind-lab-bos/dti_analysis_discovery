#!/bin/bash
#SBATCH --partition=short
#SBATCH --job-name=job.DIRTOANALYZE
#SBATCH --time=24:00:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --output=DIRTOANALYZE.output
#SBATCH --error=DIRTOANALYZE.error

module load fsl

source /shared/centos7/fsl/6.0.0/etc/fslconf/fsl.sh

export FSLOUTPUTTYPE=NIFTI_GZ

#subject name variable

cd INPUTDIRPATH
s='DIRTOANALYZE'


	echo "making ROIs directory"
	cp -r sub112_1/ROIs ${s}
	
	echo "making flirt directory"
	mkdir ${s}/flirt
	echo "running flirt"
	flirt -in ${s}/${s}_dfit_FA.nii.gz -ref ${FSLDIR}/data/standard/MNI152_T1_2mm.nii.gz -out ${s}/flirt/${s}_dfit_FA.nii.gz_flirt -omat ${s}/flirt/${s}_dfit_FA_flirt_mat
	echo "flirt complete"
	
	echo "making fnirt directory"
	mkdir ${s}/fnirt
	echo "running fnirt"
	fnirt --in=${s}/${s}_dfit_FA.nii.gz --aff=${s}/flirt/${s}_dfit_FA_flirt_mat --config=${FSLDIR}/etc/flirtsch/T1_2_MNI152_2mm.cnf --cout=${s}/fnirt/${s}_dfit_FA_warpcoeff --ref=${FSLDIR}/data/standard/MNI152_T1_2mm.nii.gz 
	echo "fnirt complete"
	
	echo "making invwarp directory"
	mkdir ${s}/invwarp
	echo "running invwarp"
	invwarp -w ${s}/fnirt/${s}_dfit_FA_warpcoeff.nii.gz -o ${s}/invwarp/${s}_dfit_FA_invwarp -r ${s}/${s}_dfit_FA.nii.gz  
	
	echo "making applywarp directory"
	mkdir ${s}/applywarp
	echo "running applywarp to move ROIs into native space"
	applywarp -i ${s}/ROIs/leftMTGp_handdrawn.nii.gz -o ${s}/ROIs/ROIs_native/leftMTGp_handdrawn_native -r ${s}/${s}_dfit_FA.nii.gz -w ${s}/invwarp/${s}_dfit_FA_invwarp.nii.gz  
	applywarp -i ${s}/ROIs/rightMTGp_handdrawn.nii.gz -o ${s}/ROIs/ROIs_native/rightMTGp_handdrawn_native -r ${s}/${s}_dfit_FA.nii.gz -w ${s}/invwarp/${s}_dfit_FA_invwarp.nii.gz 
	applywarp -i ${s}/ROIs/leftSTGp_handdrawn.nii.gz -o ${s}/ROIs/ROIs_native/leftSTGp_handdrawn_native -r ${s}/${s}_dfit_FA.nii.gz -w ${s}/invwarp/${s}_dfit_FA_invwarp.nii.gz  
	applywarp -i ${s}/ROIs/rightSTGp_handdrawn.nii.gz -o ${s}/ROIs/ROIs_native/rightSTGp_handdrawn_native -r ${s}/${s}_dfit_FA.nii.gz -w ${s}/invwarp/${s}_dfit_FA_invwarp.nii.gz   
	applywarp -i ${s}/ROIs/leftPCG_handdrawn.nii.gz -o ${s}/ROIs/ROIs_native/leftPCG_handdrawn_native -r ${s}/${s}_dfit_FA.nii.gz -w ${s}/invwarp/${s}_dfit_FA_invwarp.nii.gz
	applywarp -i ${s}/ROIs/rightPCG_handdrawn.nii.gz -o ${s}/ROIs/ROIs_native/rightPCG_handdrawn_native -r ${s}/${s}_dfit_FA.nii.gz -w ${s}/invwarp/${s}_dfit_FA_invwarp.nii.gz    
	
	echo "now tracking"
	mkdir ${s}/probtrackx
  	mkdir ${s}/probtrackx/leftPCG_leftSTGp 
    mkdir ${s}/probtrackx/leftSTGp_leftPCG  
	mkdir ${s}/probtrackx/rightPCG_rightSTGp  
    mkdir ${s}/probtrackx/rightSTGp_rightPCG 
    mkdir ${s}/probtrackx/leftPCG_leftMTGp 
    mkdir ${s}/probtrackx/leftMTGp_leftPCG
    mkdir ${s}/probtrackx/rightPCG_rightMTGp 
    mkdir ${s}/probtrackx/rightMTGp_rightPCG  
    mkdir ${s}/probtrackx/leftMTGp_leftSTGp 
    mkdir ${s}/probtrackx/leftSTGp_leftMTGp
    mkdir ${s}/probtrackx/rightMTGp_rightSTGp 
    mkdir ${s}/probtrackx/rightSTGp_rightMTGp 
      
	probtrackx2  -x ${s}/ROIs/ROIs_native/leftPCG_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/leftPCG_leftSTGp --waypoints=${s}/ROIs/ROIs_native/leftSTGp_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/leftSTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/leftSTGp_leftPCG --waypoints=${s}/ROIs/ROIs_native/leftPCG_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/rightPCG_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/rightPCG_rightSTGp --waypoints=${s}/ROIs/ROIs_native/rightSTGp_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/rightSTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/rightSTGp_rightPCG --waypoints=${s}/ROIs/ROIs_native/rightPCG_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/leftPCG_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/leftPCG_leftMTGp --waypoints=${s}/ROIs/ROIs_native/leftMTGp_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/leftMTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/leftMTGp_leftPCG --waypoints=${s}/ROIs/ROIs_native/leftPCG_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/rightPCG_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/rightPCG_rightMTGp --waypoints=${s}/ROIs/ROIs_native/rightMTGp_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/rightMTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/rightMTGp_rightPCG --waypoints=${s}/ROIs/ROIs_native/rightPCG_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/leftMTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/leftMTGp_leftSTGp --waypoints=${s}/ROIs/ROIs_native/leftSTGp_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/leftSTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/leftSTGp_leftMTGp --waypoints=${s}/ROIs/ROIs_native/leftMTGp_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/rightMTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/rightMTGp_rightSTGp --waypoints=${s}/ROIs/ROIs_native/rightSTGp_handdrawn_native.nii.gz --waycond=AND   
	probtrackx2  -x ${s}/ROIs/ROIs_native/rightSTGp_handdrawn_native.nii.gz  -l --onewaycondition -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${s}.bedpostX/merged -m ${s}.bedpostX/nodif_brain_mask  --dir=${s}/probtrackx/rightSTGp_rightMTGp --waypoints=${s}/ROIs/ROIs_native/rightMTGp_handdrawn_native.nii.gz --waycond=AND   

	
	#threshold the probtrackx paths
	fslmaths ${s}/probtrackx/leftPCG_leftSTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/leftPCG_leftSTGp/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/leftSTGp_leftPCG/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/leftSTGp_leftPCG/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/rightPCG_rightSTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/rightPCG_rightSTGp/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/rightSTGp_rightPCG/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/rightSTGp_rightPCG/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/leftPCG_leftMTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/leftPCG_leftMTGp/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/leftMTGp_leftPCG/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/leftMTGp_leftPCG/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/rightPCG_rightMTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/rightPCG_rightMTGp/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/rightMTGp_rightPCG/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/rightMTGp_rightPCG/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/leftMTGp_leftSTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/leftMTGp_leftSTGp/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/leftSTGp_leftMTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/leftSTGp_leftMTGp/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/rightMTGp_rightSTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/rightMTGp_rightSTGp/fdt_paths_thrP10
	fslmaths ${s}/probtrackx/rightSTGp_rightMTGp/fdt_paths.nii.gz -thrP 10 ${s}/probtrackx/rightSTGp_rightMTGp/fdt_paths_thrP10
	
    #average thresholded paths
	echo "average the thresholded paths to and from each ROI"
	mkdir ${s}/probtrackx/averaged
	fslmaths ${s}/probtrackx/leftPCG_leftSTGp/fdt_paths_thrP10.nii.gz -add ${s}/probtrackx/leftSTGp_leftPCG/fdt_paths_thrP10.nii.gz -div 2 ${s}/probtrackx/averaged/leftPCG_leftSTGp_fdt_paths_thrP10_avg
	fslmaths ${s}/probtrackx/rightPCG_rightSTGp/fdt_paths_thrP10.nii.gz -add ${s}/probtrackx/rightSTGp_rightPCG/fdt_paths_thrP10.nii.gz -div 2 ${s}/probtrackx/averaged/rightPCG_rightSTGp_fdt_paths_thrP10_avg
	fslmaths ${s}/probtrackx/leftPCG_leftMTGp/fdt_paths_thrP10.nii.gz -add ${s}/probtrackx/leftMTGp_leftPCG/fdt_paths_thrP10.nii.gz -div 2 ${s}/probtrackx/averaged/leftPCG_leftMTGp_fdt_paths_thrP10_avg
	fslmaths ${s}/probtrackx/rightPCG_rightMTGp/fdt_paths_thrP10.nii.gz -add ${s}/probtrackx/rightMTGp_rightPCG/fdt_paths_thrP10.nii.gz -div 2 ${s}/probtrackx/averaged/rightPCG_rightMTGp_fdt_paths_thrP10_avg
	fslmaths ${s}/probtrackx/leftMTGp_leftSTGp/fdt_paths_thrP10.nii.gz -add ${s}/probtrackx/leftSTGp_leftMTGp/fdt_paths_thrP10.nii.gz -div 2 ${s}/probtrackx/averaged/leftMTGp_leftSTGp_fdt_paths_thrP10_avg
	fslmaths ${s}/probtrackx/rightMTGp_rightSTGp/fdt_paths_thrP10.nii.gz -add ${s}/probtrackx/rightSTGp_rightMTGp/fdt_paths_thrP10.nii.gz -div 2 ${s}/probtrackx/averaged/rightMTGp_rightSTGp_fdt_paths_thrP10_avg

	echo "moving ROIs to MNI space"
    mkdir ${s}/probtrackx/averaged/normalized
    applywarp --ref=$FSLDIR/data/standard/MNI152_T1_2mm.nii --in=${s}/probtrackx/averaged/rightMTGp_rightSTGp_fdt_paths_thrP10_avg.nii.gz --out=${s}/probtrackx/averaged/normalized/rightMTGp_right_STGp_thrP10_avg_norm --warp=${s}/fnirt/${s}_dfit_FA_warpcoeff.nii.gz
    applywarp --ref=$FSLDIR/data/standard/MNI152_T1_2mm.nii --in=${s}/probtrackx/averaged/leftMTGp_leftSTGp_fdt_paths_thrP10_avg.nii.gz --out=${s}/probtrackx/averaged/normalized/leftMTGp_leftSTGp_thrP10_avg_norm --warp=${s}/fnirt/${s}_dfit_FA_warpcoeff.nii.gz
    applywarp --ref=$FSLDIR/data/standard/MNI152_T1_2mm.nii --in=${s}/probtrackx/averaged/rightPCG_rightMTGp_fdt_paths_thrP10_avg.nii.gz --out=${s}/probtrackx/averaged/normalized/rightPCG_rightMTGp_thrP10_avg_norm --warp=${s}/fnirt/${s}_dfit_FA_warpcoeff.nii.gz
    applywarp --ref=$FSLDIR/data/standard/MNI152_T1_2mm.nii --in=${s}/probtrackx/averaged/leftPCG_leftMTGp_fdt_paths_thrP10_avg.nii.gz --out=${s}/probtrackx/averaged/normalized/leftPCG_leftMTGp_thrP10_avg_norm --warp=${s}/fnirt/${s}_dfit_FA_warpcoeff.nii.gz
    applywarp --ref=$FSLDIR/data/standard/MNI152_T1_2mm.nii --in=${s}/probtrackx/averaged/rightPCG_rightSTGp_fdt_paths_thrP10_avg.nii.gz --out=${s}/probtrackx/averaged/normalized/rightPCG_rightSTGp_thrP10_avg_norm --warp=${s}/fnirt/${s}_dfit_FA_warpcoeff.nii.gz
    applywarp --ref=$FSLDIR/data/standard/MNI152_T1_2mm.nii --in=${s}/probtrackx/averaged/leftPCG_leftSTGp_fdt_paths_thrP10_avg.nii.gz --out=${s}/probtrackx/averaged/normalized/leftPCG_leftSTGp_thrP10_avg_norm --warp=${s}/fnirt/${s}_dfit_FA_warpcoeff.nii.gz

echo "finished"
