# Cluster

**Assorted Interesting Files and Notes Related to Submitting Jobs on a Batch System**

## Programmatically Submit Job for Each Folder in a Directory

a batch file is necessary [`run_all.bat`](./job_per_folder/run_all.bat) 

- that submits a job that runs python
- this python script [`submitMany.py`](./job_per_folder/submitMany.py)
    - loops over the subfolders in a directory (`all_ensembles`)
    - writes another batch file (`qbatchX`) that calls another python script, in which the necessary action is performed (e.g., Kriging, here not included)
    - this batch file is submitted via `qsub` (note that it is submitted after the directory is changed to the location where it resides)
    - and overwritten for the next loop 

This file submits for each folder a job. These jobs are queued and run as soon as there is sufficient space on the cluster. This leads to an operation that is as fast as possible (maybe not ideal under regular cluster use; in urgent situations works well; can be limited by the number of subfolders that are processed).


## Plain HGS

[`submit_hgs.sh`](./plain_hgs/submit_hgs.sh) is a plain batch file that submits an HydroGeoSphere run.

## Write a Loop in a Batch File

This is a basic way to write a loop in sh files:

    #!/bin/bash
    for number in {1..22}
    do
        CONFIG='config.ini'
        CONFIG=$CONFIG$number

        echo "$CONFIG"
    #    cat ./config/$CONFIG
        qsub -q esd1 -l nodes=1:ppn=1:esd1 model_fit.pbs -F $CONFIG
        # ./batch_test.pbs $CONFIG
        sleep 15
    done
    
This folder [`batch_loop`](./batch_loop/) contains more examples