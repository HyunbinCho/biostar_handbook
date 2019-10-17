#!/bin/bash

#suppose this is the full path
FULL=/data/foo/genome.fasta.tar.gz

#1) to make it genome.fast.tar.gz(경로 제거)
NAME=$(basename ${FULL})
echo $NAME

#2) to make it fast.tar.gz 
EXT1=${FULL#*.}
echo $EXT1

#3) to get only the extension : gz
EXT2=${FULL##*.}
echo $EXT2

#4) to get the other side : /data/foo/genome.fasta.tar
START=${FULL%.*}
echo $START
