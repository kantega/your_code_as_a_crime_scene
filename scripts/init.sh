#!/usr/bin/bash 

echo steg 1: hent og lagre git loggen
mkdir .kca
git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN' --no-renames > .kca/git_log.txt

echo 4 Kjør maat summary
echo 5 verifisere?
