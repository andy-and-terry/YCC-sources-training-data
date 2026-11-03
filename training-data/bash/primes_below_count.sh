#!/usr/bin/env bash
count_primes_below() {
  local n=$1 i j count=0
  local -a composite=()
  for ((i = 2; i < n; i++)); do
    [[ -n ${composite[i]} ]] && continue
    ((count++))
    for ((j = i * i; j < n; j += i)); do composite[j]=1; done
  done
  echo "$count"
}

count_primes_below 100
