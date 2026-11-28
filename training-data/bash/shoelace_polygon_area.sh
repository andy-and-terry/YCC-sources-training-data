#!/usr/bin/env bash
xs=(0 4 4 0)
ys=(0 0 3 3)
n=${#xs[@]}
s=0
for ((i = 0; i < n; i++)); do
  j=$(((i + 1) % n))
  ((s += xs[i] * ys[j] - xs[j] * ys[i]))
done
((s < 0)) && s=$((-s))
echo "area = $((s / 2))"
