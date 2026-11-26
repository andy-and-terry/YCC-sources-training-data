#!/usr/bin/env bash
# Deficient numbers below 100; expect 76.
proper_sum() {
  local n=$1 d t=0
  for (( d = 1; d < n; d++ )); do (( n % d == 0 )) && t=$(( t + d )); done
  echo "$t"
}
c=0
for (( n = 1; n < 100; n++ )); do
  (( $(proper_sum "$n") < n )) && c=$(( c + 1 ))
done
echo "$c"
