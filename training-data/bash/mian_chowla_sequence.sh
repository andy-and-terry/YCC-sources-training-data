#!/usr/bin/env bash
# Greedy sequence whose pairwise sums are all distinct.
seq=()
declare -A sums
cand=1
while ((${#seq[@]} < 8)); do
  declare -A fresh=()
  ok=1
  for x in "${seq[@]}" "$cand"; do
    s=$((x + cand))
    if [[ -n ${sums[$s]:-} || -n ${fresh[$s]:-} ]]; then ok=0; break; fi
    fresh[$s]=1
  done
  if ((ok)); then
    seq+=("$cand")
    for s in "${!fresh[@]}"; do sums[$s]=1; done
  fi
  unset fresh
  ((cand++))
done
echo "${seq[*]}"
