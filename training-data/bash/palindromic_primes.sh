#!/usr/bin/env bash
# Palindromic primes below 200; expect 10.
is_prime() {
  local n=$1 d
  (( n < 2 )) && return 1
  for (( d = 2; d * d <= n; d++ )); do (( n % d == 0 )) && return 1; done
  return 0
}
c=0
for (( n = 2; n < 200; n++ )); do
  if [[ "$n" == "$(echo "$n" | rev)" ]] && is_prime "$n"; then
    printf '%s ' "$n"
    c=$(( c + 1 ))
  fi
done
echo
echo "$c"
