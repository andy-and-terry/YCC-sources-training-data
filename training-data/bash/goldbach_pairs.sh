#!/usr/bin/env bash
is_prime() {
  local n=$1 d
  (( n >= 2 )) || return 1
  for (( d = 2; d * d <= n; d++ )); do (( n % d )) || return 1; done
}
n=28
for (( p = 2; p <= n / 2; p++ )); do
  is_prime "$p" && is_prime $(( n - p )) && echo "$p + $(( n - p ))"
done
