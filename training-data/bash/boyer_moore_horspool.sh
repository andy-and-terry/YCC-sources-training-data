#!/usr/bin/env bash
set -euo pipefail

horspool_all() {
    local text=$1 pat=$2 n=${#1} m=${#2} i j c
    local -A shift=()
    ((m == 0 || m > n)) && return
    for ((i = 0; i < m - 1; i++)); do shift[${pat:i:1}]=$((m - 1 - i)); done
    local hits=()
    i=0
    while ((i <= n - m)); do
        j=$((m - 1))
        while ((j >= 0)) && [[ ${text:i+j:1} == "${pat:j:1}" ]]; do ((j--)) || true; done
        ((j < 0)) && hits+=("$i")
        c=${text:i+m-1:1}
        i=$((i + ${shift[$c]:-$m}))
    done
    echo "${hits[*]}"
}

horspool_all 'here is a simple example of a simple sample' 'simple'
horspool_all 'aaaaa' 'aa'
