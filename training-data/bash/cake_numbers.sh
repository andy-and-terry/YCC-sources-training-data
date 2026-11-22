#!/usr/bin/env bash
# Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
out=()
for ((n = 0; n < 10; n++)); do out+=($(((n * n * n + 5 * n + 6) / 6))); done
echo "${out[*]}"
