#!/usr/bin/env bash
set -euo pipefail

hamming() {
  local a=$1 b=$2 d=0 i
  if ((${#a} != ${#b})); then
    echo "strands must be of equal length" >&2
    return 1
  fi
  for ((i = 0; i < ${#a}; i++)); do
    [[ ${a:i:1} != "${b:i:1}" ]] && ((++d))
  done
  echo "$d"
}

hamming GAGCCTACTAACGGGAT CATCGTAATGACGGCCT
hamming AB A || echo "(failed as expected)"
