#!/usr/bin/env bash
set -euo pipefail

next_term() {
  local s=$1 out="" i=0 j
  while ((i < ${#s})); do
    j=$i
    while ((j < ${#s})) && [[ ${s:j:1} == "${s:i:1}" ]]; do ((++j)); done
    out+="$((j - i))${s:i:1}"
    i=$j
  done
  echo "$out"
}

s=1
for _ in {1..8}; do
  echo "$s"
  s=$(next_term "$s")
done
