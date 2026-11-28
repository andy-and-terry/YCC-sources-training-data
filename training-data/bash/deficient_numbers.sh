#!/usr/bin/env bash
sigma() {
  local n=$1 d s=0
  for (( d = 1; d <= n; d++ )); do (( n % d == 0 )) && (( s += d )); done
  echo "$s"
}
for n in {1..20}; do
  (( $(sigma "$n") < 2 * n )) && printf '%d ' "$n"
done
echo
