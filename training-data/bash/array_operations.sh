#!/usr/bin/env bash
set -euo pipefail

numbers=(1 2 3 4 5 6 7 8 9 10)

evens=()
for n in "${numbers[@]}"; do
    ((n % 2 == 0)) && evens+=("$n")
done

echo "${evens[@]}"

total=0
for n in "${numbers[@]}"; do
    total=$((total + n))
done
echo "$total"
