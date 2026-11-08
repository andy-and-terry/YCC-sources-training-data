#!/usr/bin/env bash
x=(0 4 4 0)
y=(0 0 3 3)
n=${#x[@]}
s=0
for ((i = 0; i < n; i++)); do
  j=$(((i + 1) % n))
  s=$((s + x[i] * y[j] - x[j] * y[i]))
done
((s < 0)) && s=$((-s))
echo "area=$((s / 2))"
