#!/usr/bin/env bash
# Print the first 15 Pell numbers: P(n) = 2*P(n-1) + P(n-2)
a=0
b=1
for ((i = 0; i < 15; i++)); do
    echo "P($i) = $a"
    t=$((2 * b + a))
    a=$b
    b=$t
done
