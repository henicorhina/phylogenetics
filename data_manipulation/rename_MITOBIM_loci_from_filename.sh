#!/bin/bash

cd /Volumes/Brumfield_Lab_Drive/mike_data/

#---do a few loops
for fname in /Volumes/Brumfield_Lab_Drive/mike_data/mitogenomes/MITObim_whole_genome_successful_fastas/*.fasta
do
    	NAME=$(basename "$fname" '.fasta')
    	echo $NAME;
    	sed -i.OLD -E "s/^>().*/>\1$NAME/" $fname
 		rm *.fasta.OLD
done

