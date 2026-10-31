#!/usr/bin/env bash
is_sphenic() {
  local n=$1 distinct=0 p=2
  while (( p * p <= n )); do
    if (( n % p == 0 )); then
      n=$(( n / p ))
      (( n % p == 0 )) && return 1
      distinct=$(( distinct + 1 ))
    fi
    p=$(( p + 1 ))
  done
  (( n > 1 )) && distinct=$(( distinct + 1 ))
  (( distinct == 3 ))
}

for n in $(seq 2 79); do
  is_sphenic "$n" && printf '%s ' "$n"
done
echo
