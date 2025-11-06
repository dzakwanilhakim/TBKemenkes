# source:   https://github.com/jodyphelan/TBProfiler
#           https://github.com/mbhall88/tbpore

# 1. Instalation of TBprofile and TBPore
## create environment name tbenv with python 3.11
conda create -n tbenv python=3.11
conda activate tbenv

## install tbprofiler
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install -c bioconda tb-profiler

## install tbpore
conda install tbpore
tbpore download # decontamination

## initiate a workspace
cd /mnt/d
mkdir TBProject # set your workspace name (ex. TBProject)
cd TBProject

# 2. Work with TBProfiler (short reads)
cd /mnt/d/TBProject
mkdir TBProfiler # set you directory name (ex. TBProfiler)
cd TBProfiler

# 3. Work With TBPore (long reads)
cd /mnt/d/TBProject
mkdir TBPore # set your directory name (ex. TBProject)
cd TBPore
# https://www.ebi.ac.uk/ena/browser/view/ERR9030361
