#!/usr/bin/bash 
SCRIPT_DIR=$(dirname -- "$0";)

MAAT_CMD="java -jar $SCRIPT_DIR/../code-maat-1.0.4-standalone.jar"
${MAAT_CMD} -l .kca/git_log.txt -c git2 -a revisions > .kca/revisions.csv

CLOC_CMD="perl $SCRIPT_DIR/../cloc.pl"
${CLOC_CMD} ./ --unix --by-file --csv --quiet --report-file=.kca/complexity.csv

python3 "$SCRIPT_DIR/../maat-scripts-python3/merge/merge_comp_freqs.py" .kca/revisions.csv .kca/complexity.csv > .kca/hotspots.csv
