#!/usr/bin/env bash
encode() {
  local text=$1 rails=$2 i r=0 step=1
  local -a rows=()
  for ((i = 0; i < ${#text}; i++)); do
    rows[r]+=${text:i:1}
    ((r == 0)) && step=1
    ((r == rails - 1)) && step=-1
    ((r += step))
  done
  printf '%s' "${rows[@]}"
  echo
}

encode "WEAREDISCOVERED" 3
