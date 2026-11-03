#!/usr/bin/env bash
digit_square_sum() {
  local n=${1#-} sum=0 i d
  for ((i = 0; i < ${#n}; i++)); do
    d=${n:i:1}
    ((sum += d * d))
  done
  echo "$sum"
}

digit_square_sum 123
digit_square_sum -99
