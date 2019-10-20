#!/bin/bash

set -uex

#get example sequence data 
efetch -id KU182908 -db nucleotide -format fasta > KU182908.fa

#count the k-mers up to size 10
jellyfish count -C -m 10 -s10M KU182908.fa

#show an histogram of k-mers
jellyfish histo mer_counts.jf

#the k-mers present at least 7 times
jellyfish dump -L 7 mer_counts.jf

#pick one k-mer with dreg (ex: TTAAGAAAAA)
cat KU182908.fa | dreg -filter -pattern TTAAGAAAAA
