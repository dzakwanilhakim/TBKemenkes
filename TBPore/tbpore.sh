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
tbpore download # if internet stable, it will take time 20m, just press enter if thre is no respons after 20m

: << 'COMMENT_BLOCK'
The output will be like
(tbpore-env) husna@DESKTOP-HJ3UMP8:~$ tbpore download
[2025-11-08 15:49:12] INFO     | Welcome to TBpore version 0.7.1
[2025-11-08 15:49:12] INFO     | Downloading decontamination database to /home/husna/.tbpore/decontamination_db/remove_contam.map-ont.mmi. This may take a while...
[2025-11-08 16:10:07] INFO     | Validating the decontamination database...
[2025-11-08 16:10:10] SUCCESS  | Downloaded and validated the decontamination database
[2025-11-08 16:10:10] INFO     | Decompressing the decontamination database...
[2025-11-08 16:10:51] INFO     | Validating the decompressed decontamination database...
[2025-11-08 16:10:56] SUCCESS  | Decompressed and validated the decontamination database
[2025-11-08 16:10:56] SUCCESS  | Done!
COMMENT_BLOCK

# ============================================================================================

# B. Run
# Download data fastq.gz from https://drive.google.com/file/d/1Z_DSpIIj9fz_Tos8AJsqfFqk7GHhvSHN/view?usp=drive_link
mkdir /mnt/d/TBPore # For Windows
cd /mnt/d/TBPore # For Windows
mkdir -p ~/TBPore # For MacOS
cd ~/TBPore # For MacOS

# Place the data fastq.gz at drive D:\TBpore (Windows) or /Users/yourname/TBPore (MacOS) from File Explorer

# Run Process
tbpore process SRR35794933.fastq.gz

#===============================================================================================
# Troubleshoot (Windows)
# if Terminated, it is because limited resources utilized by terminal 
# write this with notepad in C:users/username/.wslconfig 
[wsl2]
memory=12GB
processors=2
swap=16GB
localhostForwarding=true

# run this ini powershell
wsl --shutdown
wsl




