#!/usr/bin/env bash
# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
p=(3 0 2)
for ((n = 3; n < 15; n++)); do
  p[n]=$((p[n - 2] + p[n - 3]))
done
echo "${p[*]}"
