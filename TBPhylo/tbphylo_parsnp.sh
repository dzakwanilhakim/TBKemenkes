#tb_genomes/
#├── Reference/ H37Rv.fasta          # reference genome (download from NCBI)
#├── TB1.fasta
#├── TB2.fasta
#├── TB3.fasta
#├── ...
#└── TB10.fasta

# Install Environment
conda create -n tb-phylo -c bioconda -c conda-forge parsnp trimal iqtree ete3 harvesttools iqtree seqkit -y
conda activate tb-phylo

mkdir -p /mnt/d/TBPhylo/tb_genomes/Reference
cd /mnt/d/TBPhylo

# 1. Run Parsnp method: Multi-MUM (Maximal Unique Match)
# -r → reference genome (H37Rv is recommended for TB)
# -d → directory with your FASTAs
# -o → output directory
#-p → number of CPU threads
parsnp -r tb_genomes/Reference/H37Rv.fasta -d tb_genomes -o tb_parsnp_out -p 2 # Maxizime usage p 

# 2. Convert .aln to fasta
# The FASTA alignment is usually already parsnp.aln
if [ -f tb_parsnp_out/parsnp.aln ]; then
    cp tb_parsnp_out/parsnp.aln core_alignment.fasta
else
    harvesttools -x tb_parsnp_out/parsnp.xmfa -M core_alignment.fasta
fi

# 3. Trimming
trimal -in core_alignment.fasta -out core_alignment_trimmed.fasta -automated1

# 4. Phylogenetic tree inference with IQ-TREE method: Maximum Likelihood
# -s → input alignment
# -m GTR+G → substitution model (good for SNPs)or use MFP (ModelFinder Plus)
# -bb 1000 → ultrafast bootstrap with 1000 replicates
# -nt AUTO → auto-detect cores
# -pre tb_phylo → output prefix
iqtree -s core_alignment_trimmed.fasta -m GTR+G -bb 1000 -nt AUTO -pre tb_phylo_trimmed

# 5. Visualize
ete3 view -t tb_phylo_trimmed.treefile --image tree.png
ete3 view -t tb_phylo_trimmed.treefile


