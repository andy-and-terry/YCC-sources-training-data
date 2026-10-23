#!/usr/bin/env bash
set -euo pipefail

# $'...' expands backslash escapes at parse time.
tabbed=$'col1\tcol2\tcol3'
echo "$tabbed"

multi=$'line one\nline two'
echo "$multi"

echo $'hex A: \x41, octal B: \102'

# Embedding a single quote without closing the string
echo $'it\'s quoted'

# Compare with plain quotes, where \t is literal
echo 'no\tescape'
