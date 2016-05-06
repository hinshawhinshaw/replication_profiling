#!/bin/bash

##add path to bedtools to local environment
##setenv PATH $PATH\:"/Users/hinshaw/Desktop/bedtools2 21-51-46/bin"

##run bedtools on all bedfiles in specified directory in next line

for bam in 'ls *.bam | sed 's/.bam//' '
do
echo ${bam}
bedtools multicov -D -q 10 -bams ${bam}.bam -bed /nfs/xray/sch/hinshaw/sequencing_data/20150528_replication_gerton/100kb_windows.bed \
| cut -f4,5 > ${bam}.tmpcnt &
done
wait
