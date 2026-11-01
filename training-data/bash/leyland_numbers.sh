#!/usr/bin/env bash
# Leyland numbers: x**y + y**x for x >= y >= 2.
vals=()
for x in 2 3 4; do
  for ((y = 2; y <= x; y++)); do
    vals+=($((x ** y + y ** x)))
  done
done
echo "${vals[*]}"
