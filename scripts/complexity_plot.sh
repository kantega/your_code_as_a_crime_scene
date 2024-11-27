#!/usr/bin/env bash

logfile=".kca/git_log.txt"
echo "0. antar at man har kjørt kca_init og revisions analyse for å finne en fil å se på"

valgt_fil=$1
echo "1. generer complexity_trend csv for valgt fil: $valgt_fil"
read

me=$0
kca_path=$(dirname "$me")

start_commit=$(git log --format="%h" | tail -n 1)
end_commit=$(git log --format="%h" | head -n 1)

valgt_fil_name=$(basename $valgt_fil)

csv_file=".kca/${valgt_fil_name}.complexity_trend.csv"

python "$kca_path/../maat-scripts-python3/miner/git_complexity_trend.py" --file "$valgt_fil" --start "$start_commit" --end "$end_commit" > "$csv_file"

echo "2. generer plot fra complexity_trend csv"
read


echo "3. vis hvor plot ligger"
read
