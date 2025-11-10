conda create -n mykrobe-env -y
conda activate mykrobe-env

for f in *.fasta *.fa; do
  [ -e "$f" ] || continue  # skip if no files match
  sample=$(basename "$f" .fasta)
  sample=${sample%.fa}  # handle .fa too
  echo "Processing $sample ..."
  
  mykrobe predict "$sample" \
    --species tb \
    --input "$f" \
    --format fasta \
    --output "${sample}_mykrobe.json"

  # Optional: convert to TSV for easy summary
  mykrobe format "${sample}_mykrobe.json" --format tsv > "${sample}_mykrobe.tsv"
done

