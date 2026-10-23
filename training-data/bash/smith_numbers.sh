#!/usr/bin/env bash
set -euo pipefail

digit_sum() {
  local n=$1 s=0
  while (( n > 0 )); do
    s=$(( s + n % 10 ))
    n=$(( n / 10 ))
  done
  echo "$s"
}

is_smith() {
  local n=$1 m=$1 p sum=0
  for (( p = 2; p * p <= m; p++ )); do
    while (( m % p == 0 )); do
      sum=$(( sum + $(digit_sum "$p") ))
      m=$(( m / p ))
    done
  done
  (( m == n )) && return 1   # prime
  (( m > 1 )) && sum=$(( sum + $(digit_sum "$m") ))
  (( sum == $(digit_sum "$n") ))
}

out=()
for (( i = 2; i < 100; i++ )); do
  if is_smith "$i"; then out+=("$i"); fi
done
echo "${out[*]}"
