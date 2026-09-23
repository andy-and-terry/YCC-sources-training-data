#!/usr/bin/env bash
set -euo pipefail

text="the quick brown fox jumps"
read -ra words <<< "$text"
echo "word count: ${#words[@]}"
echo "first word: ${words[0]}"

while read -r line; do
    echo "line: $line"
done <<< $'alpha\nbeta\ngamma'
