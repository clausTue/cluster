# Cluster

**Assorted Interesting Files and Notes Related to Submitting Jobs on a Batch System**

## Programmatically Submit Job for Each Folder in a Directory

a batch file is necessary [`run_all.bat`](./run_all.bat) 

- that submits a job that runs python
- this python script [`submitMany.py`](./submitMany.py)
    - loops over the subfolders in a directory (`all_ensembles`)
    - writes another batch file (`qbatchX`) that calls another python script, in which the necessary action is performed (e.g., Kriging, here not included)
    - this batch file is submitted via `qsub` (note that it is submitted after the directory is changed to the location where it resides)
    - and overwritten for the next loop 

This file submits for each folder a job. These jobs are queued and run as soon as there is sufficient space on the cluster. This leads to an operation that is as fast as possible (maybe not ideal under regular cluster use; in urgent situations works well; can be limited by the number of subfolders that are processed).


## Write a Loop in a Batch File
