#!/usr/bin/env bash
a=(10 9 2 5 3 7 101 18)
tails=()
for x in "${a[@]}"; do
  lo=0; hi=${#tails[@]}
  while ((lo < hi)); do
    mid=$(((lo+hi)/2))
    if ((tails[mid] < x)); then lo=$((mid+1)); else hi=$mid; fi
  done
  tails[lo]=$x
done
echo "${#tails[@]}"
