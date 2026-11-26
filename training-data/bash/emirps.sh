#!/usr/bin/env bash
# Emirps below 200; expect 15.
is_prime() {
  local n=$1 d
  (( n < 2 )) && return 1
  for (( d = 2; d * d <= n; d++ )); do (( n % d == 0 )) && return 1; done
  return 0
}
c=0
for (( n = 2; n < 200; n++ )); do
  r=$(echo "$n" | rev)
  r=$(( 10#$r ))
  if (( r != n )) && is_prime "$n" && is_prime "$r"; then c=$(( c + 1 )); fi
done
echo "$c"
