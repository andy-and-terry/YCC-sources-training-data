#!/usr/bin/env bash
set -euo pipefail

size=3
window=()
for v in 1 10 3 5 8 2; do
  window+=("$v")
  ((${#window[@]} > size)) && window=("${window[@]:1}")
  sum=0
  for w in "${window[@]}"; do ((sum += w)); done
  awk -v s="$sum" -v n="${#window[@]}" 'BEGIN { printf "%.2f ", s / n }'
done
echo
