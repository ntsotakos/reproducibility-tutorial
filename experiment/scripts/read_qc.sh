# exit if error occurs
set -e

# make directory and stage data
mkdir -p /scratch/example-script/data
DATADIRECTORY=/scratch/example-script/data

# import data from Cyverse Data Store
iget -P /iplant/home/shared/cyverse_training/datasets/PRJNA79729/fastq_files/*.fastq.gz

# make analysis directory
mkdir -p /scratch/example-script/analyses
ANALYSISDIR=/scratch/example-script/analyses

# use Docker container to run fastqc
docker run -v $DATADIRECTORY:/work quay.io/biocontainers/fastqc:0.11.7--4 fastqc /work/*.fastq.gz

#save results to analysis directory
mkdir -p $ANALYSISDIR/fastqc
mv $DATADIRECTORY/*fastqc* $ANALYSISDIR/fastqc

#use Docker container to run Trimmomatic
docker run -v $DATADIRECTORY:/work quay.io/biocontainers/trimmomatic:0.39--1 trimmomatic SE -threads 8 /work/*.fastq.qz /work/*_trimmed.fastq.gz SLIDINGWINDOW:4:30

#save results to analysis directory
mkdir -p $ANALYSISDIR/trimmomatic
mv $DATADIRECTORY/*trimmed.fastqc.gz $ANALYSISDIR/trimmomatic


