#!/usr/bin/env bash
set -euo pipefail

lcp_scan() {
    local p=$1 s
    shift
    for s in "$@"; do
        while [[ $s != "$p"* ]]; do p=${p%?}; done
    done
    echo "$p"
}

lcp_sorted() {
    local first last i=0
    first=$(printf '%s\n' "$@" | sort | head -1)
    last=$(printf '%s\n' "$@" | sort | tail -1)
    while ((i < ${#first})) && [[ ${first:i:1} == "${last:i:1}" ]]; do i=$((i + 1)); done
    echo "${first:0:i}"
}

for words in "flower flow flight" "dog racecar car" "interspecies interstellar interstate"; do
    # shellcheck disable=SC2086
    printf '%-38s scan=%-8s sorted=%s\n' "$words" "'$(lcp_scan $words)'" "'$(lcp_sorted $words)'"
done
