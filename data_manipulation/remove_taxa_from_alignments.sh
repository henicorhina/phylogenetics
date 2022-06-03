#!/bin/bash

source activate phyluce

cd /Volumes/Brumfield_Lab_Drive/data/2_phasing/


phyluce_align_extract_taxa_from_alignments \
    --alignments conbic-phased-mafft-nexus-edge-trimmed-clean/ \
    --output conbic-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude conirostrum_margaritae_15_LSU93298_0 conirostrum_margaritae_15_LSU93298_1 \
	--log-path log_conbic

phyluce_align_extract_taxa_from_alignments \
    --alignments conmar-phased-mafft-nexus-edge-trimmed-clean/ \
    --output conmar-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude conirostrum_bicolor_10_LSU43023_0 conirostrum_bicolor_10_LSU43023_1 \
	--log-path log_conmar

phyluce_align_extract_taxa_from_alignments \
    --alignments cranioleuca-phased-mafft-nexus-edge-trimmed-clean/ \
    --output cranioleuca-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude cranioleuca_dissita_L46740_0 cranioleuca_dissita_L46740_1 cranioleuca_muelleri_L25422_0 cranioleuca_muelleri_L25422_1 cranioleuca_vulpina_L25425_0 cranioleuca_vulpina_L25425_1 \
	--log-path log_cranioleuca

phyluce_align_extract_taxa_from_alignments \
    --alignments dendroplex-phased-mafft-nexus-edge-trimmed-clean/ \
    --output dendroplex-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude Dendroplex_picus_L25402_0 Dendroplex_picus_L25402_1 \
	--log-path log_dendroplex

phyluce_align_extract_taxa_from_alignments \
    --alignments elaenia-phased-mafft-nexus-edge-trimmed-clean/ \
    --output elaenia-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude elaenia_ridleyana_MZUSP80416_0 elaenia_ridleyana_MZUSP80416_1 elaenia_spectabilis_L42601_0 elaenia_spectabilis_L42601_1 \
	--log-path log_elaenia

phyluce_align_extract_taxa_from_alignments \
    --alignments furnarius-phased-mafft-nexus-edge-trimmed-clean/ \
    --output furnarius-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude furnarius_rufus_A10431_1 furnarius_rufus_A10431_0 \
	--log-path log_furnarius

phyluce_align_extract_taxa_from_alignments \
    --alignments knipolegus-phased-mafft-nexus-edge-trimmed-clean/ \
    --output knipolegus-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude Knipolegus_cyanirostris_S630514_0 Knipolegus_cyanirostris_S630514_1 Agriornis_montanus_L6710_0 Agriornis_montanus_L6710_1 Hymenops_perspicilatus_SB14701b_0 Hymenops_perspicilatus_SB14701b_1 Knipolegus_aterrimus_LSU6578_0 Knipolegus_aterrimus_LSU6578_1 Knipolegus_aterrimus_LSUMZ44399_0 Knipolegus_aterrimus_LSUMZ44399_1 Knipolegus_cabanisi_KU9690_0 Knipolegus_cabanisi_KU9690_1 Knipolegus_franciscanus_SP82727_0 Knipolegus_franciscanus_SP82727_1 Knipolegus_hudsoni_L18865_0 Knipolegus_hudsoni_L18865_1 Knipolegus_hudsoni_L19103_0 Knipolegus_hudsoni_L19103_1 Knipolegus_lophotes_SB14741_0 Knipolegus_lophotes_SB14741_1 Knipolegus_nigerimus_MPEGDZ5162_0 Knipolegus_nigerimus_MPEGDZ5162_1 Knipolegus_poecilocercus_A14176_0 Knipolegus_poecilocercus_A14176_1 Knipolegus_poecilurus_SB10607_0 Knipolegus_poecilurus_SB10607_1 Knipolegus_signatus_L44150_0 Knipolegus_signatus_L44150_1 Knipolegus_striaticeps_L38892_0 Knipolegus_striaticeps_L38892_1 knipolegus_orenocensis_46_COP882_0 knipolegus_orenocensis_46_COP882_1 knipolegus_orenocensis_47_COP629_0 knipolegus_orenocensis_47_COP629_1 knipolegus_orenocensis_48_MPEG_T15658_0 knipolegus_orenocensis_48_MPEG_T15658_1 knipolegus_orenocensis_49_USNM303_0 knipolegus_orenocensis_49_USNM303_1 \
	--log-path log_knipolegus


phyluce_align_extract_taxa_from_alignments \
    --alignments mazaria-phased-mafft-nexus-edge-trimmed-clean/ \
    --output mazaria-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude schoeniophylax_phryganophilus_LSU26013_0 schoeniophylax_phryganophilus_LSU26013_1 Schoeniophylax_phryganophylus_F334448_0 Schoeniophylax_phryganophylus_F334448_1 \
	--log-path log_mazaria

phyluce_align_extract_taxa_from_alignments \
    --alignments myrmoborus-phased-mafft-nexus-edge-trimmed-clean/ \
    --output myrmoborus-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude Myrmoborus_leucophrys_L958_0 Myrmoborus_leucophrys_L958_1 myrmoborus_leucophrys_MPEG1868_0 myrmoborus_leucophrys_MPEG1868_1 \
	--log-path log_myrmoborus

phyluce_align_extract_taxa_from_alignments \
    --alignments myrmochanes-phased-mafft-nexus-edge-trimmed-clean/ \
    --output myrmochanes-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude myrmotherula_cherriei_LSU25453_0 myrmotherula_cherriei_LSU25453_1 \
	--log-path log_myrmochanes

phyluce_align_extract_taxa_from_alignments \
    --alignments myrmotherula_assimilis-phased-mafft-nexus-edge-trimmed-clean/ \
    --output myrmotherula_assimilis-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude myrmotherula_mentriesii_LSU31383_0 myrmotherula_mentriesii_LSU31383_1 \
	--log-path log_myrmotherula_assimilis

phyluce_align_extract_taxa_from_alignments \
    --alignments myrmotherula_klagesi-phased-mafft-nexus-edge-trimmed-clean/ \
    --output myrmotherula_klagesi-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude myrmotherula_longicauda_LSU44631_0 myrmotherula_longicauda_LSU44631_1 \
	--log-path log_myrmotherula_klagesi

phyluce_align_extract_taxa_from_alignments \
    --alignments ochthornis-phased-mafft-nexus-edge-trimmed-clean/ \
    --output ochthornis-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude lathrotriccus_euleri_SB20811_0 lathrotriccus_euleri_SB20811_1 cnemotriccus_fuscatus_L74790_0 cnemotriccus_fuscatus_L74790_1 lathrotriccus_griseipectus_L66161_0 lathrotriccus_griseipectus_L66161_1 aphanotriccus_audax_L2210_0 aphanotriccus_audax_L2210_1 \
	--log-path log_ochthornis

phyluce_align_extract_taxa_from_alignments \
    --alignments serpophaga-phased-mafft-nexus-edge-trimmed-clean/ \
    --output serpophaga-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude Serpophaga_subulata_Y101031_0 Serpophaga_subulata_Y101031_1 serpophaga_munda_L38360_0 serpophaga_munda_L38360_1 \
	--log-path log_serpophaga


phyluce_align_extract_taxa_from_alignments \
    --alignments stigmatura-phased-mafft-nexus-edge-trimmed-clean/ \
    --output stigmatura-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude stigmatura_budytoides_2823_KZ516_0 stigmatura_budytoides_2823_KZ516_1 \
	--log-path log_stigmatura



phyluce_align_extract_taxa_from_alignments \
    --alignments thamnophilus-phased-mafft-nexus-edge-trimmed-clean/ \
    --output thamnophilus_cryptoleucus-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --include thamnophilus_cryptoleucus_139_LSU25431_0 thamnophilus_cryptoleucus_139_LSU25431_1 thamnophilus_cryptoleucus_141_LSU74103_0 thamnophilus_cryptoleucus_141_LSU74103_1 thamnophilus_cryptoleucus_142_LSU7285_0 thamnophilus_cryptoleucus_142_LSU7285_1 thamnophilus_cryptoleucus_144_LSU93318_0 thamnophilus_cryptoleucus_144_LSU93318_1 thamnophilus_cryptoleucus_145_MPEG_T22677_0 thamnophilus_cryptoleucus_145_MPEG_T22677_1 thamnophilus_cryptoleucus_147_MPEG_T22714_0 thamnophilus_cryptoleucus_147_MPEG_T22714_1 thamnophilus_cryptoleucus_244_MPEG_T22585_0 thamnophilus_cryptoleucus_244_MPEG_T22585_1  \
	--log-path log_thamnophilus

phyluce_align_extract_taxa_from_alignments \
    --alignments thamnophilus-phased-mafft-nexus-edge-trimmed-clean/ \
    --output thamnophilus_nigrocinereus-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/ \
    --cores 8 \
    --output-format nexus \
    --exclude thamnophilus_cryptoleucus_139_LSU25431_0 thamnophilus_cryptoleucus_139_LSU25431_1 thamnophilus_cryptoleucus_141_LSU74103_0 thamnophilus_cryptoleucus_141_LSU74103_1 thamnophilus_cryptoleucus_142_LSU7285_0 thamnophilus_cryptoleucus_142_LSU7285_1 thamnophilus_cryptoleucus_144_LSU93318_0 thamnophilus_cryptoleucus_144_LSU93318_1 thamnophilus_cryptoleucus_145_MPEG_T22677_0 thamnophilus_cryptoleucus_145_MPEG_T22677_1 thamnophilus_cryptoleucus_147_MPEG_T22714_0 thamnophilus_cryptoleucus_147_MPEG_T22714_1 thamnophilus_cryptoleucus_244_MPEG_T22585_0 thamnophilus_cryptoleucus_244_MPEG_T22585_1 thamnophilus_paliatus_H8245_0 thamnophilus_paliatus_H8245_1 thamnophilus_paliatus_KU17412_0 thamnophilus_paliatus_KU17412_1 thamnophilus_paliatus_LSU58400_0 thamnophilus_paliatus_LSU58400_1 thamnophilus_paliatus_MPEG55411_0 thamnophilus_paliatus_MPEG55411_1 \
	--log-path log_thamnophilus



source deactivate phyluce

