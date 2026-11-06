#!/usr/bin/env bash
# Highest value reached by the Collatz (hailstone) sequence from n.
peak() {
  local n=$1 best=$1
  while (( n != 1 )); do
    if (( n % 2 == 0 )); then n=$((n / 2)); else n=$((3 * n + 1)); fi
    (( n > best )) && best=$n
  done
  echo "$best"
}

peak 27
