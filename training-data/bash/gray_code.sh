#!/usr/bin/env bash
set -euo pipefail

to_gray() { echo $(($1 ^ ($1 >> 1))); }
from_gray() { local g=$1 n=$1; while (((g >>= 1) > 0)); do n=$((n ^ g)); done; echo "$n"; }
bin3() { local n=$1 s='' i; for ((i = 2; i >= 0; i--)); do s+=$(((n >> i) & 1)); done; echo "$s"; }

for i in {0..7}; do
    g=$(to_gray "$i")
    echo "$i  $(bin3 "$i")  gray=$(bin3 "$g")  back=$(from_gray "$g")"
done

# Reflected construction: prefix 0 to the list, 1 to its mirror.
codes=('')
for _ in 1 2 3; do
    next=()
    for c in "${codes[@]}"; do next+=("0$c"); done
    for ((i = ${#codes[@]} - 1; i >= 0; i--)); do next+=("1${codes[i]}"); done
    codes=("${next[@]}")
done
echo "${codes[*]}"
