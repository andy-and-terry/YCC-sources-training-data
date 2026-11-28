#!/usr/bin/env bash
s="banana"; n=${#s}; i=0
while ((i < n)); do
  j=$((i+1)); k=$i
  while ((j < n)) && [[ ${s:k:1} < ${s:j:1} || ${s:k:1} == ${s:j:1} ]]; do
    if [[ ${s:k:1} < ${s:j:1} ]]; then k=$i; else ((k++)); fi
    ((j++))
  done
  len=$((j-k))
  while ((i <= k)); do echo "${s:i:len}"; i=$((i+len)); done
done
