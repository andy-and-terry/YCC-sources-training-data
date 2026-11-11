#!/usr/bin/env bash
# Pronic numbers n(n+1)
f() { local n=$1; echo $(( n * (n + 1) )); }

for n in {0..9}; do
    printf '%s ' "$(f "$n")"
done
echo
