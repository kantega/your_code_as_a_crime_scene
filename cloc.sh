#!/usr/bin/env bash

SCRIPT_DIR=$(dirname -- "$0";)

PLATFORM=$("${SCRIPT_DIR}/detect_platform.sh" || exit 1)

if [[ "$PLATFORM" == "nix" ]]; then
    TOKEI="${SCRIPT_DIR}/bin/nix/tokei"
    JQ="${SCRIPT_DIR}/bin/nix/jq"
elif [[ "$PLATFORM" == "win" ]]; then
    TOKEI="${SCRIPT_DIR}/bin/win/tokei.exe"
    JQ="${SCRIPT_DIR}/bin/win/jq.exe"
elif [[ "$PLATFORM" == "mac" ]]; then
    TOKEI="${SCRIPT_DIR}/bin/mac/tokei"
    JQ="${SCRIPT_DIR}/bin/mac/jq"
else
    echo 'unknown OSTYPE: ' "$OSTYPE" ' cannot exec'
    exit 1
fi

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
