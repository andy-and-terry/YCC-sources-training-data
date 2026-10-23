#!/usr/bin/env bash
# Integer partitions counted with a coin-style DP.
n=9
ways=(1)
for ((i = 1; i <= n; i++)); do ways[i]=0; done
for ((part = 1; part <= n; part++)); do
  for ((t = part; t <= n; t++)); do
    ways[t]=$(( ways[t] + ways[t - part] ))
  done
done
echo "${ways[*]}"
