#!/usr/bin/env bash
set -euo pipefail

# Bash uses dynamic scoping: a callee sees the caller's local variables.
level="global"

show() {
    echo "show sees level=$level"
}

outer() {
    local level="outer-local"
    show
    inner
}

inner() {
    local level="inner-local"
    show
}

show
outer
show
