#!/usr/bin/env bash
set -euo pipefail

stack=()

push() {
    stack+=("$1")
}

pop() {
    local n=${#stack[@]}
    local value=${stack[n - 1]}
    unset "stack[n - 1]"
    echo "$value"
}

push 1
push 2
push 3
pop
pop
