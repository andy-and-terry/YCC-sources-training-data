#!/usr/bin/env bash
fact=(1 1 2 6 24 120 720 5040 40320 362880)

is_factorion() {
  local n=$1 m=$1 sum=0
  while (( m > 0 )); do
    sum=$(( sum + fact[m % 10] ))
    m=$(( m / 10 ))
  done
  (( sum == n ))
}

for (( n = 1; n < 50000; n++ )); do
  is_factorion "$n" && printf '%s ' "$n"
done
echo
