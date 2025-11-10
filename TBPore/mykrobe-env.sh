conda create -n mykrobe-env
conda install mykrobe

mykrobe predict sample \
  --species tb \
  --input sample.fasta \
  --format fasta \
  --output sample_mykrobe.json
