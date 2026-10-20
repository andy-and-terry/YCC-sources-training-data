#!/usr/bin/env bash
set -euo pipefail

declare -A count
for w in the cat and the dog and the bird; do
  count[$w]=$(( ${count[$w]:-0} + 1 ))
done
for k in "${!count[@]}"; do echo "$k ${count[$k]}"; done | sort
[[ -v count[cat] ]] && echo "has cat"
unset 'count[cat]'
echo "${#count[@]}"
