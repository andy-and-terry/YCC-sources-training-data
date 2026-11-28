#!/usr/bin/env bash
s="abcabc"; k=3; B=31; M=1000003
for ((i=0; i<=${#s}-k; i++)); do
  h=0
  sub=${s:i:k}
  for ((j=0; j<k; j++)); do
    printf -v c '%d' "'${sub:j:1}"
    h=$(( (h*B + c) % M ))
  done
  echo "$i $h"
done
