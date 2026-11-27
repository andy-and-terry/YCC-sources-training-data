#!/usr/bin/env bash
popcount() {
  local n=$1 c=0
  while ((n > 0)); do ((c += n & 1, n >>= 1)); done
  echo "$c"
}

for ((n = 0; n < 16; n++)); do
  printf '%d ' $((1 << $(popcount "$n")))
done
echo
