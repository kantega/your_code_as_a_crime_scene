#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLATFORM="nix"
elif [[ "$OSTYPE" == "msys" ]]; then
    PLATFORM="win"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="mac"
else
    echo 'unknown OSTYPE: ' "$OSTYPE" ' cannot exec'
    exit 1
fi

echo "$PLATFORM"
