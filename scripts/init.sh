#!/usr/bin/env bash

echo Steg 1: git exclude .kca mappen
mkdir .kca
grep '.kca/*' .git/info/exclude || echo -e "\n.kca/*\n" >> .git/info/exclude
echo Steg 2: hent og lagre git loggen
git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN' --no-renames > .kca/git_log.txt

echo 4 Kjør maat summary
echo 5 verifisere?
