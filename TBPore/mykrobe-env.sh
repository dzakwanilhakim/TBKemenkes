conda create -n mykrobe-env -y
conda install mykrobe gdown -y

mykrobe predict sample \
  --species tb \
  --input sample.fasta \
  --format fasta \
  --output sample_mykrobe.json

# 4. download json2xlsx converter
gdown "https://drive.google.com/uc?id=1OcbhUwv85LWR4c3aI_hNXK7bcS6gD6uf"
chmod +x json2xlsx
sed -i 's/\r$//' json2xlsx

# 5. convert mykrobe.json to mykrobe.xlsx
./json2xlsx sample_mykrobe.json
