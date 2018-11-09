#!/bin/bash
#PBS -l nodes=1:ppn=1:esd1
#PBS -l walltime=36:00:0
#PBS -N test_Simone
#PBS -q esd1
#PBS -M Simone.Vogel@student.uni-tuebingen.de

# load python module (so that python 3 is loaded)
module load devel/anaconda3/4.2.0

# execute python script
python /sfs/8/zxmra44/Cluster/submitMany.py


cd $PBS_O_WORKDIR


