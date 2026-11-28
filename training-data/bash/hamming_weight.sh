#!/usr/bin/env bash
popcount() {
  local n=$1 c=0
  while (( n )); do
    (( n &= n - 1, c++ ))
  done
  echo "$c"
}
popcount $(( 2#10110111 ))
popcount 255
