# Create a new environment (optional but recommended)
conda create -n tbpore_env python=3.10 -y
conda activate tbpore_env

# Configure channels (if not already)
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

conda install tbpore=0.7.1 -y
tbpore download

# run
tbpore process ERR9030361.fastq.gz
tbpore cluster ERR9030361.fastq.gz



