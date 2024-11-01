#! /bin/bash
 
#SBATCH --partition=brd2.4,has2.5,sib2.9,nes2.8
# SBATCH --partition=nes2.8
#SBATCH --job-name=Freeform
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=16000
#SBATCH --time=15:30:00
#SBATCH --export=ALL
#SBATCH --array=0-1999
#SBATCH --nodes=1

source ~/miniconda3/bin/activate
# ml miniconda/3/own
conda init bash

source activate Torch
export CODEDIR=/nfspool-0/home/dangd5/projects/Freeform/
export CODENAME=Cluster_Freeform_Py_Script_Variable_Thickness.py
export SAVEDIR=/DFS-L/DATA/lee/dangd5/FreeformDataset4/

mkdir ${SAVEDIR}
cd ${CODEDIR}
echo ${SLURM_ARRAY_TASK_ID}

python ${CODENAME} --jobID ${SLURM_ARRAY_JOB_ID} --taskID ${SLURM_ARRAY_TASK_ID} --path ${SAVEDIR}
