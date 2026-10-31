#!/usr/bin/env bash
persistence() {
  local n=$1 steps=0 product i
  while (( n >= 10 )); do
    product=1
    for (( i = 0; i < ${#n}; i++ )); do
      product=$(( product * ${n:i:1} ))
    done
    n=$product
    steps=$(( steps + 1 ))
  done
  echo "$steps"
}

for n in 39 77 999 10; do
  echo "$n $(persistence "$n")"
done
