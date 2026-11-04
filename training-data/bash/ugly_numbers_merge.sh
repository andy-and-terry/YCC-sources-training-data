#!/usr/bin/env bash
ugly() {
  local n=$1 i2=0 i3=0 i5=0 next
  local -a seq=(1)
  while ((${#seq[@]} < n)); do
    next=$((seq[i2] * 2))
    ((seq[i3] * 3 < next)) && next=$((seq[i3] * 3))
    ((seq[i5] * 5 < next)) && next=$((seq[i5] * 5))
    seq+=("$next")
    ((next == seq[i2] * 2)) && ((i2++))
    ((next == seq[i3] * 3)) && ((i3++))
    ((next == seq[i5] * 5)) && ((i5++))
  done
  echo "${seq[n-1]}"
}

for i in {1..12}; do printf '%s ' "$(ugly "$i")"; done; echo
