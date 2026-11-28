#!/usr/bin/env bash
add_binary() {
  local a=$1 b=$2 i=$(( ${#1} - 1 )) j=$(( ${#2} - 1 )) carry=0 out="" sum
  while (( i >= 0 || j >= 0 || carry )); do
    sum=$carry
    (( i >= 0 )) && { (( sum += ${a:i:1} )); (( i-- )); }
    (( j >= 0 )) && { (( sum += ${b:j:1} )); (( j-- )); }
    out="$(( sum % 2 ))$out"
    carry=$(( sum / 2 ))
  done
  echo "$out"
}

add_binary 1010 1011 # 10101
