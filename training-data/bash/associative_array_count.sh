#!/usr/bin/env bash
declare -A count
for w in apple pear apple fig pear apple; do
  count[$w]=$(( ${count[$w]:-0} + 1 ))
done
for k in "${!count[@]}"; do echo "$k ${count[$k]}"; done | sort
