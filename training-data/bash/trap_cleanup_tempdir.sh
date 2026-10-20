#!/usr/bin/env bash
set -euo pipefail
tmp=$(mktemp -d)
trap 'echo "cleaning $tmp"; rm -rf "$tmp"' EXIT
echo data > "$tmp/file.txt"
cat "$tmp/file.txt"
