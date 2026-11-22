#!/usr/bin/env bash
# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
r=0
out=()
for ((i = 0; i < 8; i++)); do r=$((r * 10 + 1)); out+=("$r"); done
echo "${out[*]}"
