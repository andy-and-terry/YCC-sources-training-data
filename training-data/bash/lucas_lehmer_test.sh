#!/usr/bin/env bash
set -euo pipefail

lucas_lehmer() {
  local p=$1 m s=4 i
  (( p == 2 )) && return 0
  m=$(( (1 << p) - 1 ))
  for (( i = 0; i < p - 2; i++ )); do
    s=$(( (s * s - 2) % m ))
  done
  (( s == 0 ))
}

out=()
for p in 2 3 5 7 11 13 17 19; do
  if lucas_lehmer "$p"; then out+=("$p"); fi
done
echo "${out[*]}"
