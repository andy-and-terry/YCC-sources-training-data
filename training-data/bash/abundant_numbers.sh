#!/usr/bin/env bash
divisor_sum() {
  local n=$1 s=0 d
  for ((d = 1; d < n; d++)); do ((n % d == 0)) && ((s += d)); done
  echo "$s"
}

for ((n = 1; n < 60; n++)); do
  (($(divisor_sum "$n") > n)) && printf '%d ' "$n"
done
echo
