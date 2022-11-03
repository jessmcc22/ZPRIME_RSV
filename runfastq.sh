#!/bin/bash -l

# qsub options
#$ -P infant-microbiome # project
#$ -pe mpi_16_tasks_per_node 16
#$ -l h_rt=48:00:00 # maximum run time
#$ -N run_fastqc # job name
#$ -j y # join stdout and stderr
#$ -o run_fastqc.qlog # log file name
#$ -m ea

# job info
echo "=========================================================="
echo "Start date : $(date)"
echo "Job name : $JOB_NAME"
echo "Job ID : $JOB_ID"
echo "=========================================================="
echo ""


#load packages
module load fastqc
echo ""

#run fastqc
fastqc /restricted/projectnb/infant-microbiome/data/rsv/*.fastq.gz -o /restricted/projectnb/infant-microbiome/work/nitsueh/rsv/fastqc_result
echo ""


echo "Analysis Complete!"
