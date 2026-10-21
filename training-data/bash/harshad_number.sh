#!/usr/bin/env bash
is_harshad() {
  local n=$1 s=0 m
  for ((m = n; m > 0; m /= 10)); do ((s += m % 10)); done
  ((n > 0 && n % s == 0))
}

for ((n = 1; n < 50; n++)); do
  is_harshad "$n" && printf '%d ' "$n"
done
echo
