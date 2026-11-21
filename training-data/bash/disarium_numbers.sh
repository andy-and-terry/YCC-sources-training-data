#!/usr/bin/env bash
# Disarium numbers: digits raised to their 1-based positions sum to n.
is_disarium() {
  local n=$1 sum=0 i
  for ((i = 0; i < ${#n}; i++)); do
    ((sum += ${n:i:1} ** (i + 1)))
  done
  ((sum == n))
}

out=()
for ((n = 1; n < 1000; n++)); do
  is_disarium "$n" && out+=("$n")
done
echo "${out[*]}"
