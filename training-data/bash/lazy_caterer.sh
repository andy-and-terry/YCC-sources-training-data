#!/usr/bin/env bash
# Lazy caterer sequence: max pieces from n cuts
f() { local n=$1; echo $(( ((n * (n + 1))/2) + 1 )); }

for n in {0..9}; do
    printf '%s ' "$(f "$n")"
done
echo
