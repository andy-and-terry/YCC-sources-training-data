#!/usr/bin/env bash
set -euo pipefail

# A subshell in parentheses runs in a forked copy of the shell: it can
# read outer variables but changes to them never escape back out.
counter=1
(
    counter=99
    echo "inside subshell: counter=$counter"
)
echo "outside subshell: counter=$counter"
