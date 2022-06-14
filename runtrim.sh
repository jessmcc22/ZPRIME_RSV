#!/bin/bash -l

# qsub options
#$ -P infant-microbiome # project
#$ -pe omp 8
#$ -l h_rt=3:00:00 # maximum run time
#$ -N run_trim # job name
#$ -j y # join stdout and stderr
#$ -o run_trim.qlog # log file name
#$ -t 1-246
#$ -l scratch=50G


dataDir=/restricted/projectnb/infant-microbiome/data/rsv
outDir=/restricted/projectnb/infant-microbiome/data/rsv/trim_out

sample_r1=$(sed -n -e "$SGE_TASK_ID p" "$dataDir"/samplesfile_r1.txt)
sample_r2=$(sed -n -e "$SGE_TASK_ID p" "$dataDir"/samplesfile_r2.txt)
sampleName_r1=$(basename "$sample_r1" .fastq.gz)
sampleName_r2=$(basename "$sample_r2" .fastq.gz)

#run trimmomatic
trimmomatic PE -phred33 -threads 8 $sample_r1 $sample_r2 $outDir/"${sampleName_r1}_paired.fq.gz" $outDir/"${sampleName_r1}_unpaired.fq.gz" $outDir/"${sampleName_r2}_paired.fq.gz" $outDir/"${sampleName_r2}_unpaired.fq.gz" SLIDINGWINDOW:4:20 LEADING:3 TRAILING:3 MINLEN:36
echo "Analysis Complete!"


