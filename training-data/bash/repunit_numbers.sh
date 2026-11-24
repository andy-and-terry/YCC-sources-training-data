#!/usr/bin/env bash
# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
r=0
for n in {1..8}; do
  r=$(( r * 10 + 1 ))
  if (( r % 3 == 0 )); then echo "$r  (divisible by 3)"; else echo "$r"; fi
done
