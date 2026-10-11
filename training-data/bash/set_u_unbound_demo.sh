#!/usr/bin/env bash
# set -u turns unset variable use into an error.
set -u
echo "defined: ${HOME:+set}"
if ! ( echo "$not_defined_anywhere" ) 2>/dev/null; then
    echo "unbound variable caught"
fi
echo "safe default: ${not_defined_anywhere-fallback}"
