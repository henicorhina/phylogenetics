#!/bin/sh

for dir in /Volumes/Brumfield_Lab_Drive/mike_data/2_clean_reads/*; do
	echo $dir;
	cd $dir/split-adapter-quality-trimmed/
	NAME=$(basename *-READ1.fastq.gz '.gz')
	echo $NAME;
	gzip -d *-READ1.fastq.gz
	sed -i.copy "s/.1 / 1 /g" $NAME
	gzip $NAME
	NAME=$(basename *-READ2.fastq.gz '.gz')
	gzip -d *-READ2.fastq.gz
	sed -i.copy 's/.2 / 2 /g' $NAME
	gzip $NAME
	NAME=$(basename *-READ-singleton.fastq.gz '.gz')
	echo $NAME;
	gzip -d *-READ-singleton.fastq.gz
	sed -i.copy "s/.1 / 1 /g" $NAME
	sed -i.copy2 "s/.2 / 2 /g" $NAME
	gzip $NAME
	rm *.copy*
done

