#!/usr/bin/env bash
# Hexagonal numbers: n(2n-1).
out=()
for ((n = 1; n <= 10; n++)); do out+=($(( n * (2 * n - 1) ))); done
echo "${out[*]}"
