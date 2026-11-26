#!/usr/bin/env bash
# Sexy primes below 100; expect 16 pairs.
is_prime() {
  local n=$1 d
  (( n < 2 )) && return 1
  for (( d = 2; d * d <= n; d++ )); do (( n % d == 0 )) && return 1; done
  return 0
}
c=0
for (( p = 2; p < 100; p++ )); do
  if is_prime "$p" && is_prime $(( p + 6 )); then c=$(( c + 1 )); fi
done
echo "$c"
