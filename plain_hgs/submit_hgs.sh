#!/bin/bash
#PBS -l nodes=1:ppn=1:esd1
#PBS -q esd1
#PBS -l walltime=500:00:00
#PBS -l mem=100240MB
#PBS -N Lerma_N_v20
#PBS -m ae 
#PBS -M epersaud@uoguelph.ca

# modify $MODULEPATH for the mkl module
#export MODULEPATH=/opt/bwhpc/tu/modulefiles:$MODULEPATH

# load required modules
# module purge
#module load devel/python/3.5.1 
#module load numlib/python_numpy/1.8.1-python-3.5.1 
#module load numlib/python_scipy/0.16.1-python_numpy-1.8.1-python-3.5.1
# module load lib/anaconda3/4.2.0
# module list

#echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR/
export HGSDIR=/opt/bwhpc/common/cae/hydrogeosphere/2017_12/
PATH=$PATH:$HGSDIR
export PATH

# CHANGE DIR 
$DIR = /sfs/8/e16ep01/Lerma_N_v20/

cd $DIR.
cp -a $DIR. $TMPDIR/
cd $TMPDIR/


# Applikation muss im Suchpfad vorhanden sein
# argvs: identical_string, type[dpil/flowmeter], num_of_points, run_time
grok.x >& /beegfs/work/e16ep01/grok.log 
hgs.x >& /beegfs/work/e16ep01/hgs.log 


echo $PBS_O_WORKDIR
echo $PBS_O_HOST
echo $PBS_QUEUE
echo $PBS_NODEFILE
echo $TMPDIR


# evtl. komprimieren der Ergebnisdateien
tar cvfz ergebnis.tgz $TMPDIR/result/*
cp -a $TMPDIR/. /beegfs/work/e16ep01/Lerma_N_v20/
# ggf. warten, dass alle Daten kopiert wurden
wait

#cd $PBS_O_WORKDIR/
# rmdir $TMPDIR/
#rm -rf $TMPDIR/

