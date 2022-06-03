#!/bin/sh

for f in 2_clean_reads/*/split-adapter-quality-trimmed/*2.fastq.gz; do echo $f ; zless $f | head -n 1; echo -e '\n'; done