#!/usr/bin/env bash
set -euo pipefail
shopt -s globstar

workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT

mkdir -p "$workdir/a/b/c"
touch "$workdir/a/one.txt" "$workdir/a/b/two.txt" "$workdir/a/b/c/three.txt"

count=0
for f in "$workdir"/**/*.txt; do
    echo "found: ${f#"$workdir"/}"
    count=$((count + 1))
done

echo "total files: $count"
