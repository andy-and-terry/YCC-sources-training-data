#!/usr/bin/env bash
# Bead (gravity) sort for small non-negative integers.
nums=(5 3 1 4 2)
max=5
cols=()
for ((i = 0; i < max; i++)); do cols[i]=0; done
for n in "${nums[@]}"; do for ((i = 0; i < n; i++)); do ((cols[i]++)); done; done
rows=()
for ((r = 0; r < ${#nums[@]}; r++)); do
  c=0
  for v in "${cols[@]}"; do ((v > r)) && ((c++)); done
  rows=("$c" "${rows[@]}")
done
echo "${rows[*]}"
