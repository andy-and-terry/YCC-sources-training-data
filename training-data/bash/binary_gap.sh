#!/usr/bin/env bash
set -euo pipefail

binary_gap() {
  local n=$1 best=0 last=-1 i=0
  while ((n > 0)); do
    if ((n & 1)); then
      ((last >= 0 && i - last - 1 > best)) && best=$((i - last - 1))
      last=$i
    fi
    ((n >>= 1, ++i))
  done
  echo "$best"
}

for n in 9 529 20 15 1041; do echo "$n $(binary_gap "$n")"; done
