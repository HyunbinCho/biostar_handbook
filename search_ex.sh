#!/bin/bash

#Reference : cahpter64 in biostar_handbook 

set -ue

#(default) Get a example FASTQ dataset
echo "start downloading the default FASTQ file : SRR519926" && fastq-dump --split-files SRR519926

FILENAME="SRR519926_1.fastq"
#FILENAME=$1

#ATG로 시작하는 lines
echo 'cat $FILENAME | egrep "^ATG" --color=always | head -3'
cat $FILENAME | egrep "^ATG" --color=always | head -3
printf "\n\n"

#ATG로 끝나는 lines
echo 'cat $FILENAME | egrep "ATG\$" --color=always | head -3'
cat $FILENAME | egrep "ATG\$" --color=always | head -3
printf "\n\n"

#Find TAATA or TATTA (a range of characters)
echo 'cat $FILENAME | egrep "TA[A,T]TA" --color=always | head -3'
cat $FILENAME | egrep "TA[A,T]TA" --color=always | head -3
printf "\n\n"

#Find TAAATA or TACCTA(groups of words)
echo 'cat $FILENAME | egrep "TA(AA|CC)TA" --color=always | head -3'
cat $FILENAME | egrep "TA(AA|CC)TA" --color=always | head -3
printf "\n\n"

#Quantify matches with meta-characters
#TA 뒤에 (0개 이상의) A & 그 뒤에 TA 가 오는 서열
echo 'cat $FILENAME | egrep "TA(A*)TA" --color=always | head -3'
cat $FILENAME | egrep "TA(A*)TA" --color=always | head -3
print "\n\n"

#TA 뒤에 (1개 이상의)A & 그 뒤에 TA 가 오는 서열
echo 'cat $FILENAME | egrep "TA(A+)TA" --color=always | head -3'
cat $FILENAME | egrep "TA(A+)TA" --color=always | head -3
printf "\n\n"

#TA 뒤에(2개 이상, 5개 이하의)A & 그 뒤에 TA가 오는 서열
echo 'cat $FILENAME | egrep "TAA{2,5}TA" --color=always | head -3'
cat $FILENAME | egrep "TAA{2,5}TA" --color=always | head -3
printf "\n\n"
