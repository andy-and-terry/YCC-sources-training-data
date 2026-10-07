#!/usr/bin/env bash
set -euo pipefail

nums=(1 2 3 4 5 6 7 8 9 10)

squares=()
for n in "${nums[@]}"; do squares+=($((n * n))); done

evens=()
for n in "${squares[@]}"; do
    ((n % 2 == 0)) && evens+=("$n")
done

sum=0
for n in "${evens[@]}"; do ((sum += n)); done

echo "squares: ${squares[*]}"
echo "even squares: ${evens[*]}"
echo "sum: $sum"
