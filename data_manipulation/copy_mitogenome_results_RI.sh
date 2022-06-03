#!/bin/sh

cd /Volumes/Brumfield_Lab_Drive/mitogenomes/Mitobim_whole_genome_raw_output/

for dir in /Volumes/Brumfield_Lab_Drive/mitogenomes/Mitobim_whole_genome_raw_output/*
do
        echo $dir
        NAME=$(basename $dir)
        echo $NAME
        for file in $dir/iteration*/*_noIUPAC.fasta
        do
                echo $file
                cp $file /Volumes/Brumfield_Lab_Drive/mitogenomes/MITObim_whole_genome_successful_fastas/${NAME}.fasta
        done
done

