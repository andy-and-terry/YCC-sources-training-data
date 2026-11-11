#!/usr/bin/env bash
# Count contiguous subarrays whose sum equals k (prefix sums + assoc array).
count_subarrays() {
  local k=$1; shift
  local -A seen=([0]=1)
  local total=0 count=0 x
  for x in "$@"; do
    total=$((total + x))
    count=$((count + ${seen[$((total - k))]:-0}))
    seen[$total]=$(( ${seen[$total]:-0} + 1 ))
  done
  echo "$count"
}

count_subarrays 2 1 1 1
