#!/usr/bin/env bash
# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
is_hamming() {
  local n=$1 p
  for p in 2 3 5; do
    while ((n % p == 0)); do
      ((n /= p))
    done
  done
  ((n == 1))
}

found=()
n=1
while ((${#found[@]} < 20)); do
  is_hamming "$n" && found+=("$n")
  ((n++))
done
echo "${found[*]}"
