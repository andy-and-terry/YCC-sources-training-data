#!/usr/bin/env bash
# Aliquot sequence: replace n by the sum of its proper divisors.
aliquot_sum() {
  local n=$1 s=0 d
  for ((d = 1; d <= n / 2; d++)); do
    (( n % d == 0 )) && (( s += d ))
  done
  echo "$s"
}

seq_=(12)
while (( seq_[-1] > 1 && ${#seq_[@]} < 20 )); do
  seq_+=("$(aliquot_sum "${seq_[-1]}")")
done
echo "${seq_[*]}"
