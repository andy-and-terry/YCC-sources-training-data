#!/usr/bin/env bash
set -euo pipefail

seq=(1 2)
declare -A in_seq=([1]=1 [2]=1)
for (( n = 3; ${#seq[@]} < 15; n++ )); do
  ways=0
  for a in "${seq[@]}"; do
    b=$(( n - a ))
    if (( b > a )) && [[ -n ${in_seq[$b]:-} ]]; then ways=$(( ways + 1 )); fi
  done
  if (( ways == 1 )); then
    seq+=("$n")
    in_seq[$n]=1
  fi
done
echo "${seq[*]}"
