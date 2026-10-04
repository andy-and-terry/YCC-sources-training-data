#!/usr/bin/env bash
set -euo pipefail

counter=10

modify_global() {
    counter=$((counter + 1))
}

modify_local() {
    local counter=100
    counter=$((counter + 1))
    echo "inside modify_local: $counter"
}

outer() {
    local msg="outer"
    inner() {
        # dynamic scoping: inner sees outer's local variable
        echo "inner sees msg=$msg"
    }
    inner
}

modify_global
echo "after modify_global: $counter"
modify_local
echo "after modify_local: $counter"
outer
