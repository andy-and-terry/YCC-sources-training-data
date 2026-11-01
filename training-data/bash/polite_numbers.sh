#!/usr/bin/env bash
# Ways to write n as a sum of two or more consecutive positive integers.
polite_ways() {
  local n=$1 k ways=0
  for ((k = 2; k * (k + 1) / 2 <= n; k++)); do
    (((n - k * (k - 1) / 2) % k == 0)) && ((ways++))
  done
  echo "$ways"
}

out=()
for n in $(seq 1 16); do out+=("$(polite_ways "$n")"); done
echo "${out[*]}"
