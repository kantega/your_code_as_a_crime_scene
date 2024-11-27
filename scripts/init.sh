#!/usr/bin/bash 

# TODO: Implement this
echo "0 om noen filer finnes fra før -> overwrite"
echo steg 1: hent og lagre git loggen
mkdir .kca
git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN' --no-renames > .kca/git_log.txt

echo 2 Lagre git loggen i en hidden fil
echo 3 Legger til filen i gitignore
echo 4 Kjør maat summary
echo 5 verifisere?
