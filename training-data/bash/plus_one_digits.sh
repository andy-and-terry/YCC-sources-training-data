#!/usr/bin/env bash
plus_one() {
  local d=("$@") i
  for (( i = ${#d[@]} - 1; i >= 0; i-- )); do
    if (( d[i] < 9 )); then (( d[i]++ )); echo "${d[*]}"; return; fi
    d[i]=0
  done
  echo "1 ${d[*]}"
}

plus_one 1 2 9 # 1 3 0
plus_one 9 9   # 1 0 0
