#!/usr/bin/env bash
arr=(alpha beta gamma delta epsilon)

echo "${arr[@]:1:2}"      # slice
echo "${arr[-1]}"         # last element
echo "${#arr[@]}"         # length
arr+=(zeta)
for i in "${!arr[@]}"; do
  (( i % 2 == 0 )) && echo "$i:${arr[i]}"
done
mapfile -t upper < <(printf '%s\n' "${arr[@]}" | tr a-z A-Z)
echo "${upper[2]}"
