#!/usr/bin/env bash
# Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
sopfr() {
  local n=$1 p total=0
  for ((p = 2; p * p <= n; p++)); do
    while ((n % p == 0)); do ((total += p, n /= p)); done
  done
  ((n > 1)) && ((total += n))
  echo "$total"
}

out=()
for n in $(seq 2 109); do
  [[ $(sopfr "$n") == $(sopfr $((n + 1))) ]] && out+=("$n")
done
echo "${out[*]}"
