#!/usr/bin/env bash
# Lucas numbers, iteratively.
a=2 b=1
out=()
for _ in {1..10}; do
  out+=("$a")
  next=$(( a + b ))
  a=$b
  b=$next
done
echo "${out[*]}"
