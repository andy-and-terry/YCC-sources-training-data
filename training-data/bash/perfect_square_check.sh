#!/usr/bin/env bash
is_perfect_square() {
  local n=$1 r
  r=$(awk -v n="$n" 'BEGIN { printf "%d", int(sqrt(n) + 0.5) }')
  ((r * r == n))
}

for n in $(seq 0 29); do
  is_perfect_square "$n" && printf '%d ' "$n"
done
echo
