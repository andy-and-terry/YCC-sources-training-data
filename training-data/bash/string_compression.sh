#!/usr/bin/env bash
set -euo pipefail

compress() {
    local s=$1 out='' i=0 j
    while ((i < ${#s})); do
        j=$i
        while [[ ${s:j:1} == "${s:i:1}" ]] && ((j < ${#s})); do j=$((j + 1)); done
        out+="${s:i:1}$((j - i))"
        i=$j
    done
    if ((${#out} < ${#s})); then echo "$out"; else echo "$s"; fi
}

decompress() {
    local s=$1 out='' ch n
    while [[ $s =~ ^([^0-9])([0-9]+)(.*)$ ]]; do
        ch=${BASH_REMATCH[1]} n=${BASH_REMATCH[2]} s=${BASH_REMATCH[3]}
        out+=$(printf "%${n}s" '' | tr ' ' "$ch")
    done
    echo "$out"
}

for s in aabcccccaaa abc wwwwwwwwwwwwbbbx; do
    c=$(compress "$s")
    if [[ $c != "$s" ]]; then echo "$s -> $c -> $(decompress "$c")"; else echo "$s -> $c"; fi
done
