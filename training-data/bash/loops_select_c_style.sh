#!/usr/bin/env bash
set -euo pipefail

for ((i = 0; i < 3; i++)); do printf '%d ' "$i"; done; echo
for f in {a..e}; do printf '%s' "$f"; done; echo
for n in $(seq 10 -3 1); do printf '%d ' "$n"; done; echo
i=0; while (( i < 5 )); do i=$((i + 1)); [[ $i -eq 3 ]] && continue; printf '%d ' "$i"; done; echo
until [[ $i -le 2 ]]; do i=$((i - 1)); done; echo "$i"
for outer in 1 2; do for inner in a b; do [[ $inner == b ]] && break; echo "$outer$inner"; done; done
