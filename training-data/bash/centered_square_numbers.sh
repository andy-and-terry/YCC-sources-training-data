#!/usr/bin/env bash
# Centered square numbers: n^2 + (n+1)^2.
out=()
for ((n = 0; n < 10; n++)); do out+=($(( n * n + (n + 1) * (n + 1) ))); done
echo "${out[*]}"
