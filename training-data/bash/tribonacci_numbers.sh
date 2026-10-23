#!/usr/bin/env bash
# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
a=0; b=0; c=1
terms=()
for ((i = 0; i < 15; i++)); do
    terms+=("$a")
    next=$((a + b + c))
    a=$b; b=$c; c=$next
done

echo "Tribonacci: ${terms[*]}"
