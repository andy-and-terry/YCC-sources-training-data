#!/usr/bin/env bash
cake() { echo $(( ($1 ** 3 + 5 * $1 + 6) / 6 )); }
out=()
for n in {0..9}; do out+=("$(cake "$n")"); done
echo "${out[*]}" # 1 2 4 8 15 26 42 64 93 130
