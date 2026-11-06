#!/usr/bin/env bash
# Repunits: numbers made only of the digit 1.
r=0
for _ in 1 2 3 4 5; do
  r=$((r * 10 + 1))
  printf '%d ' "$r"
done
echo
