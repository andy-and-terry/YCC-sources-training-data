#!/usr/bin/env bash
max_area() {
  local h=("$@") lo=0 hi=$(( $# - 1 )) best=0 m area
  while (( lo < hi )); do
    m=$(( h[lo] < h[hi] ? h[lo] : h[hi] ))
    area=$(( m * (hi - lo) ))
    (( area > best )) && best=$area
    if (( h[lo] < h[hi] )); then (( lo++ )); else (( hi-- )); fi
  done
  echo "$best"
}

max_area 1 8 6 2 5 4 8 3 7 # 49
