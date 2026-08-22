#!/usr/bin/env bash
set -euo pipefail

for i in {1..5}; do
    for j in {1..5}; do
        printf "%3d" $((i * j))
    done
    echo
done
