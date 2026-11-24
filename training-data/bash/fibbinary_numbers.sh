#!/usr/bin/env bash
# Fibbinary numbers: no two adjacent 1 bits.
out=()
for ((n = 0; n < 50; n++)); do
  (( (n & (n >> 1)) == 0 )) && out+=("$n")
done
echo "${out[*]}"
