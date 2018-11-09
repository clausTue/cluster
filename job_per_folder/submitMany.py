import os
import time
import shutil

dir = os.path.dirname(__file__)
print(dir)

in_en_dir = os.path.join(dir, 'weathercop')
krig_raw_dir = os.path.join(dir, 'Weathercop_Kriging_general.py')
all_ensembles = os.listdir(in_en_dir)

for i in all_ensembles:

	ens_dir = os.path.join(in_en_dir, i)
	script_path = os.path.abspath(shutil.copy2(krig_raw_dir, ens_dir))

	fh = open(os.path.join(dir, "qbatchX"),"w")

	fh.write("#!/bin/bash\n")
	fh.write("#PBS -l nodes=1:ppn=1:esd1\n")
	fh.write("#PBS -q esd1\n")
	fh.write("#PBS -l walltime=999:00:0\n")
	fh.write("#PBS -N ensemble{}\n".format(i))
	fh.write("#PBS -M Simone.Vogel@student.uni-tuebingen.de\n")

	fh.write("module load devel/anaconda3/4.2.0\n")

	fh.write("python {}\n".format(script_path))
	fh.write("echo $PBS_O_WORKDIR\n")
	fh.write("echo $PBS_O_HOST\n")
	fh.write("echo $PBS_QUEUE\n")
	fh.write("echo $PBS_NODEFILE\n")
	fh.write("echo $TMPDIR\n")

	fh.close()

	os.chdir('{}'.format(dir))
	os.system('qsub -q esd1 {}'.format(os.path.join(dir, "qbatchX")))


	time.sleep(10)

	# os.chdir('..')

