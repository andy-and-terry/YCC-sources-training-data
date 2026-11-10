#!/usr/bin/env bash
central_delannoy() {
  local n=$1 i j
  local -A g
  for (( i = 0; i <= n; i++ )); do
    for (( j = 0; j <= n; j++ )); do
      if (( i == 0 || j == 0 )); then g[$i,$j]=1
      else g[$i,$j]=$(( g[$((i-1)),$j] + g[$i,$((j-1))] + g[$((i-1)),$((j-1))] )); fi
    done
  done
  echo "${g[$n,$n]}"
}
out=()
for n in 0 1 2 3 4 5; do out+=("$(central_delannoy "$n")"); done
echo "${out[*]}" # 1 3 13 63 321 1683
