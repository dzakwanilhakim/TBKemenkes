#!/bin/bash
#├── Reference/ H37Rv.fasta          # reference genome (download from NCBI)
#├── TB1.fasta
#├── TB2.fasta
#├── TB3.fasta
#├── ...
#└── TB10.fasta

# Alignment
read -p "Enter number of threads to use (min: 1): " P
read -p "MSA method (muscle/mafft): " N
read -p "Partition size (misal 5 partisi, berarti jika  total fasta 500, akan ada 5 batch alignment @ 100fasta: " MIN
echo "1) Running parsnp with $part threads, msa with $msa, partition size $part"

parsnp -r tb_genomes/Reference/H37Rv.fasta \
       -d tb_genomes \
       -o tb_parsnp_out \
       -p $P \
       -n $N \
       --min-partition-size $MIN
       
# Convert
echo "2) Convert"
if [ -f tb_parsnp_out/parsnp.aln ]; then
    cp tb_parsnp_out/parsnp.aln core_alignment.fasta
else
    harvesttools -x tb_parsnp_out/parsnp.xmfa -M core_alignment.fasta
fi

# Trimming
echo "3) Trimming"
trimal -in core_alignment.fasta -out core_alignment_trimmed.fasta -automated1

# Tree Consctruction
echo "4) Tree Construction"
iqtree -s core_alignment_trimmed.fasta -m GTR+G -bb 1000 -nt AUTO -pre tb_phylo_trimmed

# Visualization
echo "5) Visualization"
ete3 view -t tb_phylo_trimmed.treefile --image tree.png
ete3 view -t tb_phylo_trimmed.treefile
