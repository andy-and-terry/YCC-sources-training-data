#!/usr/bin/env bash
# Matrix rows are passed as space-separated strings.
is_toeplitz() {
  local -a prev cur
  local i j
  read -ra prev <<<"$1"; shift
  for row in "$@"; do
    read -ra cur <<<"$row"
    for ((j = 1; j < ${#cur[@]}; j++)); do
      [[ ${cur[j]} == ${prev[j-1]} ]] || { echo false; return; }
    done
    prev=("${cur[@]}")
  done
  echo true
}

is_toeplitz "1 2 3" "4 1 2" "5 4 1"
is_toeplitz "1 2" "2 2"
