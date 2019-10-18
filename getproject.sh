#!/bin/bash

##Usage: getproject.sh PRJN NUM

##Example: bash getproject.sh PRJNA257197 3

##This program downloads a NUM number of experiments from an SRA Bioproject

# identified by the PRJN number then runs FastQC quality reports before
# and after trimming the data for quality.
# Immediately stop on errors.
set -uex

# The required parameter is the run id.
PRJN=$1

# How many experimental runs to get.
NUM=$2

# What is the conversion limit for each data.
LIMIT=10000

# Get the run information for the project.
# You may comment out this line if you already have an info.csv.
esearch -db sra -query $PRJN | efetch -format runinfo > runinfo.csv

# Keep only the ids that match SRR number.
cat runinfo.csv | cut -f 1 -d ',' | grep SRR | head -${NUM} > ids.csv

# We place an echo before each command to see what will get executed when it runs.
cat ids.csv | parallel echo fastq-dump --split-files -X ${LIMIT} {}

#Generate the commands for fastqc.
cat ids.csv | parallel echo fastqc {}_1.fastq {}_2.fastq

# Generate the commands for trimmomatic.
# Here we run it with the -baseout flag to generatevfile extension of .fq.
cat ids.csv | parallel echo trimmomatic PE -baseout {}.fq {}_1.fastq {}_2.fastq 

# Run FastQC on the new data that matches the *.fq extension.
cat ids.csv | parallel echo fastqc {}_1P.fq {}_2P.fq
