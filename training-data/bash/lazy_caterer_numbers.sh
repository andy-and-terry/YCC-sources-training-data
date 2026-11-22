#!/usr/bin/env bash
# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
out=()
for ((n = 0; n < 10; n++)); do out+=($((n * (n + 1) / 2 + 1))); done
echo "${out[*]}"
