#!/usr/bin/env bash
# Pentagonal numbers: n(3n-1)/2.
out=()
for ((n = 1; n <= 10; n++)); do out+=($(( n * (3 * n - 1) / 2 ))); done
echo "${out[*]}"
