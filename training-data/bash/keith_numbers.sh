#!/usr/bin/env bash
# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
is_keith() {
  local n=$1 i sum
  local -a seq=()
  for ((i = 0; i < ${#n}; i++)); do seq+=("${n:i:1}"); done
  local k=${#seq[@]}
  while ((seq[-1] < n)); do
    sum=0
    for ((i = ${#seq[@]} - k; i < ${#seq[@]}; i++)); do ((sum += seq[i])); done
    seq+=("$sum")
  done
  ((seq[-1] == n))
}

out=()
for ((n = 10; n < 1200; n++)); do
  is_keith "$n" && out+=("$n")
done
echo "${out[*]}"
