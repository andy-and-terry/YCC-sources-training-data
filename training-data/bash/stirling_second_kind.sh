#!/usr/bin/env bash
# Stirling numbers of the second kind.
stirling2() {
  local n=$1 k=$2 i j
  declare -A t
  t[0,0]=1
  for ((i = 1; i <= n; i++)); do
    for ((j = 0; j <= k; j++)); do t[$i,$j]=0; done
    for ((j = 1; j <= k && j <= i; j++)); do
      t[$i,$j]=$(( j * ${t[$((i - 1)),$j]:-0} + ${t[$((i - 1)),$((j - 1))]:-0} ))
    done
  done
  echo "${t[$n,$k]}"
}
stirling2 5 2
stirling2 6 3
