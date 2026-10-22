#!/usr/bin/env bash
set -euo pipefail

nums=()
for (( v = 1; v <= 50; v += 2 )); do nums+=("$v"); done
for (( i = 1; i < ${#nums[@]} && nums[i] <= ${#nums[@]}; i++ )); do
  step=${nums[i]}
  kept=()
  for idx in "${!nums[@]}"; do
    if (( (idx + 1) % step != 0 )); then kept+=("${nums[idx]}"); fi
  done
  nums=("${kept[@]}")
done
echo "${nums[*]}"
