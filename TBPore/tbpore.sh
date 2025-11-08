# A. Installation
# 1. Create a new environment (optional but recommended)
conda create -n tbpore-env -y
conda activate tbpore-env

# 2. Configure channels (if not already)
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

conda install tbpore=0.7.1 -y
conda update tbpore -y

# 3. Check Installation
tbpore --version
tbpore --help

# 4. Download Database
# check for the internet speed first
conda install -c conda-forge speedtest-cli -y
speedtest-cli 
# then, download the database
tbpore download # Will take time more than 1 hours

# ============================================================================================

# B. Run
# run, download sample data from https://www.ebi.ac.uk/ena/browser/view/ERR9030361
mkdir /mnt/d/TBPore
cd /mnt/d/TBPore
tbpore process ERR9030361.fastq.gz
tbpore cluster ERR9030361.fastq.gz

# if Terminated, write this in C:users/username/.wslconfig
[wsl2]
memory=12GB
processors=2
swap=16GB
localhostForwarding=true

# run this ini powershell
wsl --shutdown
wsl




