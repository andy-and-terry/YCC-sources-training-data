#!/usr/bin/env bash
set -euo pipefail

workdir=$(mktemp -d)
tmpfile=$(mktemp "$workdir/data.XXXXXX")

cleanup() {
    rm -rf "$workdir"
    echo "removed $workdir"
}
trap cleanup EXIT

printf '%s\n' banana apple cherry apple > "$tmpfile"
echo "temp file exists: $([[ -f $tmpfile ]] && echo yes || echo no)"

sort -u "$tmpfile" > "$workdir/sorted.txt"
echo "unique lines:"
cat "$workdir/sorted.txt"
echo "line count: $(wc -l < "$workdir/sorted.txt")"
