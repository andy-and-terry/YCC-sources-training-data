#!/usr/bin/env bash
set -euo pipefail

# Bash uses dynamic scoping: a callee sees the caller's locals.
x="global"

inner() { echo "inner sees x=$x"; }

outer() {
    local x="outer-local"
    inner
}

inner
outer
inner
