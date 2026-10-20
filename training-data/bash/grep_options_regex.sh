#!/usr/bin/env bash
set -euo pipefail

text=$'error: disk full\nwarning: low mem\nERROR: net down\ninfo: ok'
echo "$text" | grep -ci error
echo "$text" | grep -n 'warn'
echo "$text" | grep -E '^(error|info)'
echo "$text" | grep -v ':' || echo "none without colon"
echo "$text" | grep -oE '[a-z]+(:)' | head -2
echo "$text" | grep -iE 'error' | sed 's/.*: //'
echo "alpha beta" | grep -ow 'alpha'
