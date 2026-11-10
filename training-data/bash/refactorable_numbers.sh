#!/usr/bin/env bash
tau() {
  local n=$1 d c=0
  for (( d = 1; d <= n; d++ )); do (( n % d == 0 )) && (( c++ )); done
  echo "$c"
}
out=()
for (( n = 1; n < 60; n++ )); do
  (( n % $(tau "$n") == 0 )) && out+=("$n")
done
echo "${out[*]}" # 1 2 8 9 12 18 24 36 40 56
