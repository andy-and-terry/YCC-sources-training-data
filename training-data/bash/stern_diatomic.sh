#!/bin/bash
seq=(0 1)
for ((i = 2; i < 15; i++)); do
    h=$((i / 2))
    if (( i % 2 == 0 )); then
        seq[i]=${seq[h]}
    else
        seq[i]=$((seq[h] + seq[h + 1]))
    fi
done
echo "${seq[*]}" # 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
