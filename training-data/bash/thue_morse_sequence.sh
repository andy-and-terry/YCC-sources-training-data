#!/usr/bin/env bash
# Thue-Morse: t(n) is the parity of the number of 1 bits in n
out=""
for ((n = 0; n < 32; n++)); do
  ones=0
  for ((m = n; m > 0; m >>= 1)); do
    ((ones += m & 1))
  done
  out+=$((ones % 2))
done
echo "$out"
