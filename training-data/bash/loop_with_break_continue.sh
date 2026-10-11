#!/usr/bin/env bash
# break and continue with numeric levels in nested loops.
for i in 1 2 3; do
    for j in 1 2 3; do
        (( j == 2 )) && continue
        (( i == 3 )) && break 2
        echo "i=$i j=$j"
    done
done
echo done
