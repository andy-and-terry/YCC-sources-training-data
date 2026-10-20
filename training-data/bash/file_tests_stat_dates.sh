#!/usr/bin/env bash
set -euo pipefail

f=$(mktemp); echo hello > "$f"
stat -c '%s bytes mode %a' "$f"
touch -d '2020-01-02 03:04:05' "$f"
date -r "$f" +%Y-%m-%d
date -u -d @86400 +'%F %T'
date -d '2024-02-28 + 2 days' +%F
dirname /a/b/c.txt; basename /a/b/c.txt .txt; realpath -m /a/b/../c
rm -f "$f"
