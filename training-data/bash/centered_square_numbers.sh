#!/usr/bin/env bash
# Centered square numbers 2n(n+1)+1
f() { local n=$1; echo $(( ((2 * n) * (n + 1)) + 1 )); }

for n in {0..9}; do
    printf '%s ' "$(f "$n")"
done
echo
