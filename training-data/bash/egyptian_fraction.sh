#!/usr/bin/env bash
# Greedy Egyptian fraction expansion of 4/13.
num=4; den=13
parts=()
while (( num != 0 )); do
  d=$(( (den + num - 1) / num ))
  parts+=("1/$d")
  num=$(( num * d - den ))
  den=$(( den * d ))
done
( IFS=+; echo "${parts[*]}" )
