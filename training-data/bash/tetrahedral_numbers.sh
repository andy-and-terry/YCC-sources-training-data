#!/usr/bin/env bash
# Tetrahedral numbers n(n+1)(n+2)/6
f() { local n=$1; echo $(( ((n * (n + 1)) * (n + 2))/6 )); }

for n in {0..9}; do
    printf '%s ' "$(f "$n")"
done
echo
