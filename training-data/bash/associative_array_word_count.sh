#!/usr/bin/env bash
declare -A count
for w in the cat the dog the end; do
  ((count[$w]++))
done
for k in "${!count[@]}"; do
  echo "$k ${count[$k]}"
done | sort
