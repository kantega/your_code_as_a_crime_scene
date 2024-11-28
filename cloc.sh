#!/usr/bin/env bash

SCRIPT_DIR=$(dirname -- "$0";)

TOKEI="${SCRIPT_DIR}/bin/tokei"
JQ="${SCRIPT_DIR}/bin/jq"

# count lines of code with tokei
# reformat as csv with jq
"$TOKEI" --output json | "$JQ" '
to_entries
  | map(
	.key as $lang
	| .value.reports[]
	| { "language": $lang, "filename": .name, "blank": .stats.blanks, "comment": .stats.comments, "code": .stats.code })
  | ["language","filename","blank","comment","code"] as $cols
  | map(. as $row | $cols | map($row[.])) as $rows
  | $cols, $rows[]
  | @csv' -r
