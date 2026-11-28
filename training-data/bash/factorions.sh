#!/bin/bash
fact=(1 1 2 6 24 120 720 5040 40320 362880)
for ((n = 1; n < 50000; n++)); do
    s=0
    for ((m = n; m > 0; m /= 10)); do
        s=$((s + fact[m % 10]))
    done
    (( s == n )) && printf '%s ' "$n"
done
echo # 1 2 145 40585
