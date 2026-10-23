#!/usr/bin/env bash
set -euo pipefail

polygonal() {
  local s=$1 n=$2
  echo $(( ((s - 2) * n * n - (s - 4) * n) / 2 ))
}

for entry in Triangular:3 Pentagonal:5 Hexagonal:6; do
  name=${entry%%:*}
  sides=${entry##*:}
  nums=()
  for n in {1..10}; do
    nums+=("$(polygonal "$sides" "$n")")
  done
  echo "$name: ${nums[*]}"
done
