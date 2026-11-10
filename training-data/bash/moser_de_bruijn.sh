#!/usr/bin/env bash
# Read the binary digits of i as base-4 digits.
moser_de_bruijn() {
  local i=$1 value=0 power=1
  while (( i > 0 )); do
    (( i & 1 )) && (( value += power ))
    (( power *= 4, i >>= 1 ))
  done
  echo "$value"
}
out=()
for i in {0..9}; do out+=("$(moser_de_bruijn "$i")"); done
echo "${out[*]}" # 0 1 4 5 16 17 20 21 64 65
