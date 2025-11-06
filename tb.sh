# source:   https://github.com/jodyphelan/TBProfiler
#           https://github.com/mbhall88/tbpore


# create environment name tbenv with python 3.11
conda create -n tbenv python=3.11
conda activate tbenv

# install tbprofiler
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install -c bioconda tb-profiler

# install tbpore
conda install tbpore