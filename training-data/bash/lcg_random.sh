#!/usr/bin/env bash
# Deterministic linear congruential generator.
seed=42
next() {
    seed=$(( (seed * 1103515245 + 12345) & 0x7fffffff ))
}
for _ in 1 2 3 4 5; do
    next
    echo $(( seed % 100 ))
done
