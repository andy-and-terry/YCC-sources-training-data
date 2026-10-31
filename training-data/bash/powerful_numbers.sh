#!/usr/bin/env bash
is_powerful() {
  local n=$1 p=2
  while (( p * p <= n )); do
    if (( n % p == 0 )); then
      (( n % (p * p) != 0 )) && return 1
      while (( n % p == 0 )); do n=$(( n / p )); done
    fi
    p=$(( p + 1 ))
  done
  (( n == 1 ))
}

for n in $(seq 1 100); do
  is_powerful "$n" && printf '%s ' "$n"
done
echo
