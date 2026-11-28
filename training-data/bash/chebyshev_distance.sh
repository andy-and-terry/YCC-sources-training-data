#!/usr/bin/env bash
chebyshev() {
  local -n a=$1 b=$2
  local m=0 i d
  for i in "${!a[@]}"; do
    d=$(( a[i] - b[i] )); (( d < 0 )) && d=$(( -d ))
    (( d > m )) && m=$d
  done
  echo "$m"
}
p=(1 2); q=(4 6)
chebyshev p q
