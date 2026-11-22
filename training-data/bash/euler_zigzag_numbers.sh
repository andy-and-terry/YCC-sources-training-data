#!/usr/bin/env bash
# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
row=(1)
out=(1)
for ((i = 0; i < 9; i++)); do
    next=(0)
    for ((j = ${#row[@]} - 1; j >= 0; j--)); do
        next+=($((next[-1] + row[j])))
    done
    row=("${next[@]}")
    out+=("${row[-1]}")
done
echo "${out[*]}"
