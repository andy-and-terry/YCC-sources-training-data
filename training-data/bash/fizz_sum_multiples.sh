#!/usr/bin/env bash
# Sum of multiples of 3 or 5 below N.
n=${1:-1000}
sum=0
for ((i = 1; i < n; i++)); do
    (( i % 3 == 0 || i % 5 == 0 )) && (( sum += i ))
done
echo "sum below $n: $sum"
