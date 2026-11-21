#!/usr/bin/env bash
# Cyclops numbers: odd digit count, middle digit zero, no other zeros.
# Count those in 1..9999 (expected 81; 5-digit cases skipped to keep it fast).
is_cyclops() {
  local s=$1 len=${#1} zeros
  ((len % 2 == 1)) || return 1
  [[ ${s:len/2:1} == 0 ]] || return 1
  zeros=${s//[^0]/}
  ((${#zeros} == 1))
}

count=0
for ((n = 1; n < 10000; n++)); do
  is_cyclops "$n" && ((count++))
done
echo "$count"
