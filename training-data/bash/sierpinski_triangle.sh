#!/usr/bin/env bash
n=8
for ((r=0; r<n; r++)); do
  printf '%*s' $((n-r-1)) ''
  for ((c=0; c<=r; c++)); do
    (( (r & c) == c )) && printf '* ' || printf '  '
  done
  echo
done
