#!/usr/bin/env bash
# Aliquot sum classification.
aliquot() { local n=$1 s=0 d; for ((d = 1; d < n; d++)); do ((n % d == 0)) && s=$((s + d)); done; echo "$s"; }
for n in 6 12 15 28; do
  a=$(aliquot "$n")
  if ((a == n)); then k=perfect; elif ((a > n)); then k=abundant; else k=deficient; fi
  echo "$n $a $k"
done
