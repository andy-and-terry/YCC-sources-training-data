#!/usr/bin/env bash
set -euo pipefail

printf '%5d|%-5d|%05d\n' 42 42 42
printf '%8.3f|%e\n' 3.14159 1234.5
printf '%x %X %o\n' 255 255 8
printf '%-10s|%10s|\n' left right
printf '%s\n' "${BASH_VERSION:+bash}"
printf -v padded '%03d' 7
echo "$padded"
printf '%q\n' "a b'c"
