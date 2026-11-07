#!/usr/bin/env bash
# Intervals are "lo,hi" strings; the new interval is the last argument.
insert_interval() {
  local new=${!#} n=$(( $# - 1 )) lo hi out=() i
  IFS=, read -r lo hi <<< "$new"
  local args=("$@") a b placed=0
  for (( i = 0; i < n; i++ )); do
    IFS=, read -r a b <<< "${args[i]}"
    if (( b < lo )); then out+=("$a,$b")
    elif (( a > hi )); then
      (( placed )) || { out+=("$lo,$hi"); placed=1; }
      out+=("$a,$b")
    else
      (( a < lo )) && lo=$a
      (( b > hi )) && hi=$b
    fi
  done
  (( placed )) || out+=("$lo,$hi")
  echo "${out[*]}"
}

insert_interval 1,3 6,9 2,5 # 1,5 6,9
