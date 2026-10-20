#!/usr/bin/env bash
set -euo pipefail

FOO=outer
( FOO=inner; echo "sub: $FOO" )
echo "main: $FOO"
export BAR=exported
bash -c 'echo "child sees: ${BAR:-none} ${FOO:-none}"'
FOO=temp bash -c 'echo "temp env: $FOO"'
readonly CONST=1
( CONST=2 ) 2>/dev/null || echo "readonly enforced"
