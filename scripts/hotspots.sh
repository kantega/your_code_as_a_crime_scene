#!/usr/bin/bash 
SCRIPT_DIR=$(dirname -- "$0";)

MAAT_CMD="java -jar $SCRIPT_DIR/../code-maat-1.0.4-standalone.jar"
${MAAT_CMD} -l .kca/git_log.txt -c git2 -a revisions > .kca/revisions.csv

CLOC_CMD="perl $SCRIPT_DIR/../cloc.pl"
${CLOC_CMD} ./ --unix --by-file --csv --quiet --report-file=.kca/complexity.csv

# Check if python3 is available
if command -v python3 &>/dev/null; then
    PYTHON_CMD=python3
# Check if python is available
elif command -v python &>/dev/null; then
    PYTHON_CMD=python
else
    echo "Error: Python is not installed."
    exit 1
fi

# You can now use $PYTHON_CMD to run your Python scripts
$PYTHON_CMD "$SCRIPT_DIR/../maat-scripts-python3/merge/merge_comp_freqs.py" .kca/revisions.csv .kca/complexity.csv > .kca/hotspots.csv
