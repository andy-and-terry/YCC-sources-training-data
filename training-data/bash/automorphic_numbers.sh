#!/bin/bash
for ((n = 0; n < 1000; n++)); do
    sq=$((n * n))
    if [[ "$sq" == *"$n" ]]; then
        printf '%s ' "$n"
    fi
done
echo # 0 1 5 6 25 76 376 625
