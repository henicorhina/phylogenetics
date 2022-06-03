



rsync --rsh=ssh --archive --stats --progress \
	/Volumes/Backup_Plus/Epinecrophylla/1_analysis/divergence_dates/BEAST_mtDNA/partitioned_by_gene-cytB_rate-BD_uniform-rates_uniform_v2/ \
	ojohnson@smic.hpc.lsu.edu:/work/ojohnson/Epinecrophylla/BEAST_mtDNA/partitioned_by_gene-cytB_rate-BD_uniform-rates_uniform_v2/


scp /Users/harveylab/Downloads/structure_mac_console.tar.gz \
  ojohnson@jakar.utep.edu:/home/ojohnson/bin/fst_scripts

rsync --rsh=ssh --archive --stats --progress \
  	Trogon_rufus-phased-mafft-nexus-untrimmed-complete-clean-AmazonOnly/ \
  	ojohnson@jakar.utep.edu:/home/ojohnson/alignments/Trogon_rufus-phased-mafft-nexus-untrimmed-complete-clean-AmazonOnly/



--include='*_AmazonOnly/*' --exclude='*'



records = SeqIO.parse("/Volumes/Brumfield_Lab_Drive/River_islands/2_phasing/4_alignments/Trogon_collaris-phased-mafft-concatenated/Trogon_collaris-phased-mafft-concatenated.phylip", "phylip")
SeqIO.write(records, "/Volumes/Brumfield_Lab_Drive/River_islands/2_phasing/4_alignments/Trogon_collaris-phased-mafft-concatenated/Trogon_collaris-phased-mafft-concatenated.fasta", "fasta")


sparse.data <- import_fasta_sparse_nt("/Volumes/Brumfield_Lab_Drive/file.fa")
sparse.data <- optimise_prior(sparse.data, type = "optimise.symmetric")
baps.hc <- fast_baps(sparse.data)
clusters <- best_baps_partition(sparse.data, as.phylo(baps.hc))


cd /Volumes/Brumfield_Lab_Drive/River_islands/2_phasing/2_complete-taxon-set/1_cleaned_alignments-nexus-no_outgroups/
