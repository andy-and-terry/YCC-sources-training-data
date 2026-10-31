#!/usr/bin/env bash
alternating_digit_sum() {
  local n=$1 total=0 sign=1
  while (( n > 0 )); do
    total=$(( total + sign * (n % 10) ))
    sign=$(( -sign ))
    n=$(( n / 10 ))
  done
  echo "$total"
}

for n in 1234 99999 1000; do
  echo "$n $(alternating_digit_sum "$n")"
done
