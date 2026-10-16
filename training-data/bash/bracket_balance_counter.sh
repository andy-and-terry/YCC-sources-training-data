#!/usr/bin/env bash
# Track nesting depth of brackets and report the maximum.
s="(a(b)(c(d)))"
depth=0 max=0
for ((i = 0; i < ${#s}; i++)); do
    case ${s:i:1} in
        '(') (( ++depth > max )) && max=$depth ;;
        ')') (( depth-- )) ;;
    esac
done
echo "final depth $depth, max depth $max"
