#!/usr/bin/env bash
alphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZ
affine() {
  local msg=$1 a=$2 b=$3 out="" i x
  for (( i = 0; i < ${#msg}; i++ )); do
    local pre=${alphabet%%${msg:i:1}*}
    x=${#pre}
    out+=${alphabet:$(( (a * x + b) % 26 )):1}
  done
  echo "$out"
}
affine AFFINE 5 8
