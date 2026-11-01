#!/usr/bin/env bash
# n is triangular iff 8n + 1 is a perfect square.
isqrt() { local n=$1 r=0; while ((( r + 1 ) * ( r + 1 ) <= n)); do ((r++)); done; echo "$r"; }

out=()
for n in $(seq 0 20); do
  s=$((8 * n + 1))
  r=$(isqrt "$s")
  ((r * r == s)) && out+=("$n")
done
echo "${out[*]}"
