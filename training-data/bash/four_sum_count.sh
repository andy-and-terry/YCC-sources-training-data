#!/usr/bin/env bash
declare -A sums
a=(1 2); b=(-2 -1); c=(-1 2); d=(0 2)

for x in "${a[@]}"; do
  for y in "${b[@]}"; do (( sums[$((x + y))]++ )); done
done

count=0
for x in "${c[@]}"; do
  for y in "${d[@]}"; do (( count += ${sums[$(( -(x + y) ))]:-0} )); done
done
echo "$count" # 2
