#!/usr/bin/env bash
set -euo pipefail

n=100
fibs=(1 2)
while (( fibs[-1] <= n )); do
  fibs+=($(( fibs[-1] + fibs[-2] )))
done

out=()
for (( i = ${#fibs[@]} - 1; i >= 0; i-- )); do
  if (( fibs[i] <= n )); then
    out+=("${fibs[i]}")
    n=$(( n - fibs[i] ))
  fi
done
echo "${out[*]}"
