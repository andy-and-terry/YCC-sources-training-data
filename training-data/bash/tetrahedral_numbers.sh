#!/usr/bin/env bash
# Tetrahedral numbers: n(n+1)(n+2)/6.
out=()
for ((n = 1; n <= 10; n++)); do out+=($(( n * (n + 1) * (n + 2) / 6 ))); done
echo "${out[*]}"
