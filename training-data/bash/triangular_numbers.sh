#!/usr/bin/env bash
sum=0
for n in {1..10}; do
  ((sum += n))
  printf '%d ' "$sum"
done
echo
