#!/usr/bin/env bash
# Secant method for x^2 - 2, using bc for floating point.
x0=1
x1=2
for _ in $(seq 50); do
  f0=$(echo "$x0 * $x0 - 2" | bc -l)
  f1=$(echo "$x1 * $x1 - 2" | bc -l)
  [[ $(echo "$f1 == $f0" | bc) == 1 ]] && break
  next=$(echo "$x1 - $f1 * ($x1 - $x0) / ($f1 - $f0)" | bc -l)
  x0=$x1
  x1=$next
done
printf '%.10f\n' "$x1"
