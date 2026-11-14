#!/usr/bin/env bash
data=$'alice,30,NYC\nbob,25,LA'
while IFS=, read -r name age city; do
  printf '%s is %s from %s\n' "$name" "$age" "$city"
done <<< "$data"
