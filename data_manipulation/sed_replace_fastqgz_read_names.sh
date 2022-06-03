#!/bin/sh

for dir in /Volumes/Brumfield_Lab_Drive/mike_data/2_clean_reads/*_AMNH12719; do
	echo $dir;
	cd $dir/split-adapter-quality-trimmed/
	for file in *-READ2*; do
		echo $file;
		NAME=$(basename "$file" '.gz')
		echo $NAME;
		gzip -d $file
		sed -i.copy 's/.2 / 2 /g' $NAME
		gzip $NAME
	done;
	cd $dir/split-adapter-quality-trimmed/
	for file in *-READ1*; do
		NAME=$(basename "$file" '.gz')
		echo $file;
		echo $NAME;
		gzip -d $file
		sed -i.copy "s/.1 / 1 /g" $NAME
		gzip $NAME
	done;
	for file in *-READ-singleton.*; do
		NAME=$(basename "$file" '.gz')
		echo $file;
		echo $NAME;
		gzip -d $file
		sed -i.copy "s/.1 / 1 /g" $NAME
		sed -i.copy2 "s/.2 / 2 /g" $NAME
		gzip $NAME
	done;
done

