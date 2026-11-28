#!/usr/bin/env bash
declare -A in_a in_b all
for x in 1 2 3 4; do in_a[$x]=1; all[$x]=1; done
for x in 3 4 5; do in_b[$x]=1; all[$x]=1; done
inter=0
for k in "${!all[@]}"; do
  [[ -n ${in_a[$k]:-} && -n ${in_b[$k]:-} ]] && (( inter++ ))
done
echo "scale=2; $inter / ${#all[@]}" | bc
