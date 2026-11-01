#!/usr/bin/env bash
# Positive n expressible as a*a + b*b with a, b >= 0.
representable() {
  local n=$1 a b
  for ((a = 0; a * a <= n; a++)); do
    for ((b = a; a * a + b * b <= n; b++)); do
      ((a * a + b * b == n)) && return 0
    done
  done
  return 1
}

out=()
for n in $(seq 1 30); do
  representable "$n" && out+=("$n")
done
echo "${out[*]}"
