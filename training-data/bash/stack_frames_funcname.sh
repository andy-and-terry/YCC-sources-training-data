#!/usr/bin/env bash
# Inspect the call stack via FUNCNAME.
a() { b; }
b() { c; }
c() {
    local i
    for i in "${!FUNCNAME[@]}"; do
        echo "frame $i: ${FUNCNAME[i]}"
    done
}
a
