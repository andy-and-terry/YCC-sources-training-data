#!/usr/bin/env bash
# Squarefree numbers up to 100; expect 61.
squarefree() {
  local n=$1 d
  for (( d = 2; d * d <= n; d++ )); do (( n % (d * d) == 0 )) && return 1; done
  return 0
}
c=0
for (( n = 1; n <= 100; n++ )); do squarefree "$n" && c=$(( c + 1 )); done
echo "$c"
