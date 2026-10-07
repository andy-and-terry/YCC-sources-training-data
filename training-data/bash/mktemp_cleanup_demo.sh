#!/usr/bin/env bash
set -euo pipefail

workdir=$(mktemp -d)
cleanup() {
    rm -rf "$workdir"
    echo "cleaned up $workdir"
}
trap cleanup EXIT

printf '%s\n' banana apple cherry > "$workdir/fruits.txt"
sort "$workdir/fruits.txt" > "$workdir/sorted.txt"
echo "sorted contents:"
cat "$workdir/sorted.txt"
echo "files: $(ls "$workdir" | wc -l)"
