#!/usr/bin/env bash
sigma() {
  local n=$1 d s=0
  for (( d = 1; d <= n; d++ )); do (( n % d == 0 )) && (( s += d )); done
  echo "$s"
}
out=()
for (( n = 1; n < 100; n++ )); do
  (( $(sigma "$(sigma "$n")") == 2 * n )) && out+=("$n")
done
echo "${out[*]}" # 2 4 16 64
