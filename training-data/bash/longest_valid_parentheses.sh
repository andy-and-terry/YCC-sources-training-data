#!/usr/bin/env bash
set -euo pipefail

longest_valid() {
    local s=$1 stack=(-1) best=0 i len
    for ((i = 0; i < ${#s}; i++)); do
        if [[ ${s:i:1} == '(' ]]; then stack+=("$i"); continue; fi
        unset 'stack[-1]'
        if ((${#stack[@]} == 0)); then
            stack=("$i")
        else
            len=$((i - stack[-1]))
            ((len > best)) && best=$len
        fi
    done
    echo "$best"
}

for s in '(()' ')()())' '' '()(()' '((()))()'; do printf "%-10s %d\n" "'$s'" "$(longest_valid "$s")"; done
