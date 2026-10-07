#!/usr/bin/env bash
set -euo pipefail

pair_with_sum() {
  local target=$1
  shift
  local nums=("$@") i=0 j=$(($# - 1)) s
  while ((i < j)); do
    s=$((nums[i] + nums[j]))
    if ((s == target)); then echo "$i $j"; return 0; fi
    if ((s < target)); then ((++i)); else ((--j)); fi
  done
  return 1
}

pair_with_sum 10 1 3 4 6 8 11
pair_with_sum 100 1 2 3 || echo "no pair"
