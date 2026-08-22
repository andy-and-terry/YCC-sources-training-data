#!/usr/bin/env bash
set -euo pipefail

items=(apple banana apple cherry banana apple)
declare -A counts

for item in "${items[@]}"; do
    counts[$item]=$(( ${counts[$item]:-0} + 1 ))
done

for item in "${!counts[@]}"; do
    if ((counts[$item] > 1)); then
        echo "$item: ${counts[$item]}"
    fi
done | sort
