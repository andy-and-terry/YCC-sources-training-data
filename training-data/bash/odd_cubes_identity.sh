#!/usr/bin/env bash
cube_from_odds() {
  local n=$1 start sum=0 i
  start=$(( n * n - n + 1 ))
  for (( i = 0; i < n; i++ )); do
    sum=$(( sum + start + 2 * i ))
  done
  echo "$sum"
}

for n in 1 2 3 4 5; do
  echo "$n $(cube_from_odds "$n") $(( n * n * n ))"
done
