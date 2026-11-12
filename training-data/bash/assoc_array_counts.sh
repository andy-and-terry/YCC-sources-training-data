#!/usr/bin/env bash
declare -A count
for w in a b a c b a; do (( count[$w]++ )); done
for k in "${!count[@]}"; do echo "$k ${count[$k]}"; done | sort
