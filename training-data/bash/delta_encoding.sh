#!/usr/bin/env bash
xs=(10 12 15 15 20)
d=("${xs[0]}")
for ((i = 1; i < ${#xs[@]}; i++)); do d+=($((xs[i] - xs[i-1]))); done
echo "${d[*]}"
acc=0
for v in "${d[@]}"; do acc=$((acc + v)); printf '%d ' "$acc"; done
echo
