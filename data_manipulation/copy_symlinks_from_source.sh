#!/bin/sh

for species in Campephilus Cantorchilus Celeus Crypturellus Formicarius Glaucidium Hylophylax Megascops Monasa Myrmeciza Myrmoborus Phaethornis Pheugopedius Piaya Pipra Saltator Schiffornis Synallaxis Tachyphonus Trogon Xiphorhynchus
do
cp -aL 3_spades_assembly/contigs/${species}* 3_spades_contigs_by_genus/${species}/
done

