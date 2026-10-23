#!/usr/bin/env bash
# Derangement counts: D(n) = (n-1) * (D(n-1) + D(n-2)).
d=(1 0)
for ((i = 2; i < 8; i++)); do
  d[i]=$(( (i - 1) * (d[i - 1] + d[i - 2]) ))
done
echo "${d[*]}"
