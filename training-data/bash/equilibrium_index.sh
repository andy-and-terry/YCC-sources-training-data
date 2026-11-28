#!/usr/bin/env bash
equilibrium_index() {
  local nums=("$@") total=0 left=0 i
  for v in "${nums[@]}"; do (( total += v )); done
  for i in "${!nums[@]}"; do
    if (( left == total - left - nums[i] )); then echo "$i"; return; fi
    (( left += nums[i] ))
  done
  echo -1
}

equilibrium_index 1 7 3 6 5 6 # 3
