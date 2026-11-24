#!/usr/bin/env bash
# Moser-de Bruijn sequence: binary digits of n read in base 4.
moser() {
  local n=$1 result=0 place=1
  while (( n > 0 )); do
    (( n & 1 )) && (( result += place ))
    (( n >>= 1, place *= 4 ))
  done
  echo "$result"
}

out=()
for ((i = 0; i < 12; i++)); do out+=("$(moser "$i")"); done
echo "${out[*]}"
