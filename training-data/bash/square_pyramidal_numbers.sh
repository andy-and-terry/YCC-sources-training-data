#!/usr/bin/env bash
# n(n+1)(2n+1)/6
for n in {1..15}; do
    printf '%2d -> %d\n' "$n" $(( ((n * (n + 1)) * ((2 * n) + 1)) / 6 ))
done
