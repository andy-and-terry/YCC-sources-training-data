#!/usr/bin/env bash
set -euo pipefail

proper_divisor_sum() {
  local n=$1 sum=0 d
  for (( d = 1; d <= n / 2; d++ )); do
    if (( n % d == 0 )); then sum=$(( sum + d )); fi
  done
  echo "$sum"
}

n=12
seq=("$n")
while (( n != 0 )); do
  n=$(proper_divisor_sum "$n")
  seq+=("$n")
done
echo "${seq[*]}"
