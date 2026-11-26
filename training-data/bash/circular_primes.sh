#!/usr/bin/env bash
# Circular primes below 100; expect 13.
is_prime() {
  local n=$1 d
  (( n < 2 )) && return 1
  for (( d = 2; d * d <= n; d++ )); do (( n % d == 0 )) && return 1; done
  return 0
}
circular() {
  local s=$1 i
  for (( i = 0; i < ${#s}; i++ )); do
    is_prime $(( 10#${s:i}${s:0:i} )) || return 1
  done
  return 0
}
c=0
for (( n = 2; n < 100; n++ )); do circular "$n" && c=$(( c + 1 )); done
echo "$c"
