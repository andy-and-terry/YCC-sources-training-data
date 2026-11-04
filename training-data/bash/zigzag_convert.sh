#!/usr/bin/env bash
# Zigzag reading of a string across N rows.
zigzag() {
  local s=$1 rows=$2 r=0 step=1 i
  local -a lines=()
  for ((i = 0; i < rows; i++)); do lines[i]=""; done
  for ((i = 0; i < ${#s}; i++)); do
    lines[r]+="${s:i:1}"
    ((r == 0)) && step=1
    ((r == rows - 1)) && step=-1
    ((r += step))
  done
  printf '%s' "${lines[@]}"; echo
}

zigzag "PAYPALISHIRING" 3
