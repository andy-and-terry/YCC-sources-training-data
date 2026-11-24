#!/usr/bin/env bash
# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
mobius() {
  local n=$1 result=1 p=2
  while (( p * p <= n )); do
    if (( n % p == 0 )); then
      (( n /= p ))
      (( n % p == 0 )) && { echo 0; return; }
      (( result = -result ))
    fi
    (( p++ ))
  done
  (( n > 1 )) && (( result = -result ))
  echo "$result"
}

out=()
for n in $(seq 1 30); do out+=("$(mobius "$n")"); done
echo "${out[*]}"
