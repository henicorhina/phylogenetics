#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Sep 28 13:27:06 2018

@author: tobias andermann, edited by oscar johnson
"""

import pandas as pd
import numpy as np
import argparse
from Bio import SeqIO

# Get arguments
def get_args():
        parser = argparse.ArgumentParser(
                description="convert fasta SNP files to tped and tfam",
                formatter_class=argparse.ArgumentDefaultsHelpFormatter
        )
        parser.add_argument(
                '--input',
                required=True,
                action=CompletePath,
                default=None,
                help='The directory containing fasta-snp file'
        )
        parser.add_argument(
                '--output',
                required=True,
                action=CompletePath,
                default=None,
                help='The output directory where results will be saved'
        )
        return parser.parse_args()

# Get arguments
args = get_args()
# Set working directory
work_dir = args.input
out_dir = args.output
# Create the output directory
if not os.path.exists(out_dir):
        os.makedirs(out_dir)


fasta_in = '/Volumes/Brumfield_Lab_Drive/data/2_phasing/conbic_full-phased-mafft-fasta-edge-trimmed-clean-onesnpperlocus/snp.fasta'

fasta_sequences = SeqIO.parse(open(fasta_in),'fasta')

names_sequence_dict = {}
for fasta in fasta_sequences:
    name = fasta.id
    sequence = str(fasta.seq)
    names_sequence_dict.setdefault(name,sequence)
    align_length = len(sequence)

columns = ['arbitrary_number','no_info_1','no_info_2', 'SNP_index']+sorted(list(names_sequence_dict.keys()))
a_df = pd.DataFrame(index=np.arange(0,align_length),columns=columns)
a_df[columns[0]] = [1]*align_length
a_df[columns[1]] = np.arange(0,align_length)
a_df[columns[2]] = [0]*align_length
a_df[columns[3]] = np.arange(0,align_length)
for i in range(len(names_sequence_dict.keys())):
    key = sorted(names_sequence_dict.keys())[i]
    sequence = names_sequence_dict[key]
    index = i+4
    a_df[columns[index]] = np.array(list(sequence))
a_df.to_csv('/Volumes/Brumfield_Lab_Drive/data/2_phasing/conbic_full-phased-mafft-fasta-edge-trimmed-clean-onesnpperlocus/snp.tped',index=False,header=False,sep='\t')


columns = ['family_id','individual_id','paternal_id','maternal_id','sex','phenotype']
a_df = pd.DataFrame(index=np.arange(0,len(list(names_sequence_dict.keys()))),columns=columns)
a_df[columns[0]] = np.arange(1,len(list(names_sequence_dict.keys()))+1)
a_df[columns[1]] = np.array(sorted(list(names_sequence_dict.keys())))
a_df[columns[2]] = [0]*int(len(list(names_sequence_dict.keys())))
a_df[columns[3]] = [0]*int(len(list(names_sequence_dict.keys())))
a_df[columns[4]] = [0]*int(len(list(names_sequence_dict.keys())))
a_df[columns[5]] = [-9]*int(len(list(names_sequence_dict.keys())))
a_df.to_csv('/Volumes/Brumfield_Lab_Drive/data/2_phasing/conbic_full-phased-mafft-fasta-edge-trimmed-clean-onesnpperlocus/snp.tfam',index=False,header=False,sep='\t')



