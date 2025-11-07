# A. Installation
# Create a new environment (optional but recommended)
conda create -n tbpore_env python=3.10 -y
conda activate tbpore_env

# Configure channels (if not already)
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

conda install tbpore=0.7.1 -y
tbpore download # Will take time more than 1 hours

# B. Run
# run, download sample data from https://www.ebi.ac.uk/ena/browser/view/ERR9030361
mkdir /mnt/d/TBPore
cd /mnt/d/TBPore
tbpore process ERR9030361.fastq.gz
tbpore cluster ERR9030361.fastq.gz



