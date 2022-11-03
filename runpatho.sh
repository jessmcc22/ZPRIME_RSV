#!/bin/bash -l

# qsub options
#$ -P infant-microbiome # project
#$ -pe omp 8
#$ -l h_rt=4:00:00 # maximum run time
#$ -N run_patho # job name
#$ -j y # join stdout and stderr
#$ -o run_patho.qlog # log file name
#$ -t 1-200
#$ -l scratch=100G



dataDir=/restricted/projectnb/infant-microbiome/work/nitsueh/rsv
outDir=/restricted/projectnb/infant-microbiome/work/nitsueh/rsv/patho_out

sample_r1=$(sed -n -e "$SGE_TASK_ID p" "$dataDir"/tfile_r1.txt)
sample_r2=$(sed -n -e "$SGE_TASK_ID p" "$dataDir"/tfile_r2.txt)
sampleName_r1=$(basename "$sample_r1" .fq.gz)
sampleName_r2=$(basename "$sample_r2" .fq.gz)



###make working directory
workingDir=junk_$SGE_TASK_ID
rm -rf $TMPDIR/$workingDir
mkdir $TMPDIR/$workingDir


###pathoscope
module load bowtie2
module unload python3
module load python2
pathoscope=/restricted/projectnb/pathoscope/code/PathoScope/pathoscope/pathoscope2.py
indDir=/restricted/projectnb/pathoscope/reflib/2020_index_bowtie
targLibs="bacteria,viral"
filterLibs="human_mouse,phix174"

$pathoscope MAP -1 $sample_r1 -2 $sample_r2 -indexDir $indDir -targetIndexPrefixes $targLibs -filterIndexPrefixes $filterLibs -expTag $sampleName_r1 -outDir $TMPDIR/$workingDir

$pathoscope ID -expTag $sampleName_r1  -alignFile $TMPDIR/$workingDir"/outalign.sam" --noUpdatedAlignFile -outDir $outDir

rm -rf $TMPDIR/$workingDir


