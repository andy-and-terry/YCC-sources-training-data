#!/usr/bin/env bash
# Lattice paths with a DP row.
lattice() {
  local n=$1 j k
  local row=()
  for ((j = 0; j <= n; j++)); do row[j]=1; done
  for ((k = 0; k < n; k++)); do for ((j = 1; j <= n; j++)); do row[j]=$((row[j] + row[j - 1])); done; done
  echo "${row[n]}"
}
lattice 3
