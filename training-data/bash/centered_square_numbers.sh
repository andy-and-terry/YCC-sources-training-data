#!/usr/bin/env bash
# 2n(n-1)+1
for n in {1..15}; do
    printf '%2d -> %d\n' "$n" $(( ((2 * n) * (n - 1)) + 1 ))
done
