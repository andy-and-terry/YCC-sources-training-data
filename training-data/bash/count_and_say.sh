#!/usr/bin/env bash
set -euo pipefail

next_term() {
    local s=$1 out='' i=0 j
    while ((i < ${#s})); do
        j=$i
        while [[ ${s:j:1} == "${s:i:1}" ]]; do j=$((j + 1)); done
        out+="$((j - i))${s:i:1}"
        i=$j
    done
    echo "$out"
}

t=1
for _ in {1..10}; do
    echo "$t"
    t=$(next_term "$t")
done
