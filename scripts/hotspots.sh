#!/usr/bin/env bash

REPO_DIR=$(git rev-parse --show-toplevel)
KCA_DIR="$REPO_DIR/.kca"
logfile="$KCA_DIR/git_log.txt"

if [ ! -e "$logfile" ]
then
    echo "Du mangler en git log. Du må kjøre kca_init"
    exit 1
fi

SCRIPT_DIR=$(dirname -- "$0";)

echo Steg 1 Genererer revisions fil
MAAT_CMD="java -jar $SCRIPT_DIR/../code-maat-1.0.4-standalone.jar"
${MAAT_CMD} -l $KCA_DIR/git_log.txt -c git2 -a revisions > $KCA_DIR/revisions.csv
echo Steg 2 Genererer kompleksitet fil

# CLOC_CMD="perl $SCRIPT_DIR/../cloc.pl"
# ${CLOC_CMD} ./ --unix --by-file --csv --quiet --report-file=$KCA_DIR/complexity.csv
"${SCRIPT_DIR}/../cloc.sh" > "$KCA_DIR/complexity.csv"


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
echo Steg 3 Slår sammen til hotspot fil
# You can now use $PYTHON_CMD to run your Python scripts
# TODO: read files to ignore from somewhere else 
$PYTHON_CMD "$SCRIPT_DIR/../maat-scripts-python3/merge/merge_comp_freqs.py" "$KCA_DIR/revisions.csv" "$KCA_DIR/complexity.csv" | grep -v 'pom.xml|package-lock.json' | head | tee "$KCA_DIR/hotspots.csv"
echo Steg 4 Genererer graf
$PYTHON_CMD "$SCRIPT_DIR/plotting/hotspot_plot.py" "$KCA_DIR/hotspots.csv" "$KCA_DIR/hotspot_plot.png"
