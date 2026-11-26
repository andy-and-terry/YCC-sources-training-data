#!/usr/bin/env bash
# Goldbach partitions of 100; expect 6.
is_prime() {
  local n=$1 d
  (( n < 2 )) && return 1
  for (( d = 2; d * d <= n; d++ )); do (( n % d == 0 )) && return 1; done
  return 0
}
c=0
for (( p = 2; p <= 50; p++ )); do
  if is_prime "$p" && is_prime $(( 100 - p )); then echo "$p+$(( 100 - p ))"; c=$(( c + 1 )); fi
done
echo "$c"
