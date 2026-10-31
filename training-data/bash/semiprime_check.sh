#!/usr/bin/env bash
prime_factor_count() {
  local n=$1 count=0 p=2
  while (( p * p <= n )); do
    while (( n % p == 0 )); do
      n=$(( n / p ))
      count=$(( count + 1 ))
    done
    p=$(( p + 1 ))
  done
  (( n > 1 )) && count=$(( count + 1 ))
  echo "$count"
}

for n in $(seq 2 29); do
  [[ $(prime_factor_count "$n") -eq 2 ]] && printf '%s ' "$n"
done
echo
