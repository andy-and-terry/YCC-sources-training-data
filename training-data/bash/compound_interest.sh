#!/usr/bin/env bash
# Fixed-point compound interest using integer cents.
principal=100000   # cents
rate_bp=450        # basis points (4.50%)
for year in 1 2 3 4 5; do
    principal=$(( principal + principal * rate_bp / 10000 ))
    printf 'year %d: %d.%02d\n' "$year" $((principal / 100)) $((principal % 100))
done
