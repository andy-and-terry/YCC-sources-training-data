#!/usr/bin/env bash
# Evil numbers have an even number of 1 bits.
popcount() { local n=$1 c=0; while ((n)); do ((c += n & 1, n >>= 1)); done; echo "$c"; }

out=()
for n in $(seq 0 20); do
  (($(popcount "$n") % 2 == 0)) && out+=("$n")
done
echo "${out[*]}"
