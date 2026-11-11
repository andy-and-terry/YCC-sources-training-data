#!/usr/bin/env bash
# Emirps: primes whose digit reversal is a different prime.
is_prime() {
  local n=$1 i
  (( n < 2 )) && return 1
  for ((i = 2; i * i <= n; i++)); do
    (( n % i == 0 )) && return 1
  done
  return 0
}

for ((n = 2; n < 100; n++)); do
  r=$((10#$(rev <<< "$n")))
  if (( r != n )) && is_prime "$n" && is_prime "$r"; then
    printf '%d ' "$n"
  fi
done
echo
