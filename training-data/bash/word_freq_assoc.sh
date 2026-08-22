#!/usr/bin/env bash
set -euo pipefail

text="the quick brown fox jumps over the lazy dog the fox runs"

declare -A counts
for word in $text; do
    counts["$word"]=$(( ${counts["$word"]:-0} + 1 ))
done

for word in "${!counts[@]}"; do
    echo "$word: ${counts[$word]}"
done | sort -t: -k2 -rn | head -3
