#!/usr/bin/env bash
set -euo pipefail

declare -A d
size=10
for (( m = 0; m < size; m++ )); do
  for (( n = 0; n < size; n++ )); do
    if (( m == 0 || n == 0 )); then
      d[$m,$n]=1
    else
      d[$m,$n]=$(( d[$((m-1)),$n] + d[$m,$((n-1))] + d[$((m-1)),$((n-1))] ))
    fi
  done
done
central=()
for (( i = 0; i < size; i++ )); do central+=("${d[$i,$i]}"); done
echo "${central[*]}"
