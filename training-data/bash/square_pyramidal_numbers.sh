#!/usr/bin/env bash
# Square pyramidal numbers n(n+1)(2n+1)/6
f() { local n=$1; echo $(( ((n * (n + 1)) * ((2 * n) + 1))/6 )); }

for n in {0..9}; do
    printf '%s ' "$(f "$n")"
done
echo
