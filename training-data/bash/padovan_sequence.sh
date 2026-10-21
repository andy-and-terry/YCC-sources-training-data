#!/usr/bin/env bash
# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
p=(1 1 1)
for ((i = 3; i < 15; i++)); do
  p[i]=$(( p[i-2] + p[i-3] ))
done
echo "${p[@]}"
