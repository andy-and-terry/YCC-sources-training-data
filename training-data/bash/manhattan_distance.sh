#!/usr/bin/env bash
manhattan() {
  local -n a=$1 b=$2
  local s=0 i d
  for i in "${!a[@]}"; do
    d=$(( a[i] - b[i] ))
    (( s += d < 0 ? -d : d ))
  done
  echo "$s"
}
p=(1 2); q=(4 6)
manhattan p q
