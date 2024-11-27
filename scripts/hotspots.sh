#!/usr/bin/bash 
SCRIPT_DIR=$(dirname -- "$0";)

MAAT_CMD="java -jar $SCRIPT_DIR/../code-maat-1.0.4-standalone.jar"
${MAAT_CMD} -l .kca/git_log.txt -c git2 -a revisions > .kca/revisions.csv
