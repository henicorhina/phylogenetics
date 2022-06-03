#!/bin/bash

for dir in /Volumes/Brumfield_Lab_Drive/data/2_phasing/2_bams/*-multialign-bams/; do
	echo $dir
	ls -l $dir | grep -c ^d
	echo $" "
done 

