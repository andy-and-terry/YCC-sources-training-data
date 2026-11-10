#!/usr/bin/env bash
pieces() { echo $(( ($1 * $1 + $1 + 2) / 2 )); }
out=()
for n in {0..9}; do out+=("$(pieces "$n")"); done
echo "${out[*]}" # 1 2 4 7 11 16 22 29 37 46
