#!/usr/bin/env python

"""

Name: interleave_fastas.py

Author: brentp (https://www.biostars.org/p/67246/)
Date: 26 February 2019

call program and provide list of files to interleave as arguments

"""


from itertools import groupby, izip, chain
import sys

def fasta_iter(fasta_name):
    fh = open(fasta_name)
    faiter = (x[1] for x in groupby(fh, lambda line: line[0] == ">"))
    for header in faiter:
        header = header.next()[1:].strip()
        yield header, "".join(s.strip() for s in faiter.next())

# interleave the fastas with izip and chain the results. this is all lazy
fastas = chain.from_iterable(izip(*[fasta_iter(fa) for fa in sys.argv[1:]]))

f = open("joined_allele_sequences_all_samples.fasta", "w")
for header, seq in fastas:
 	f.write(">" + header + "\n")
	f.write(seq + "\n")
    #print ">", header
    #print seq