#!/usr/bin/env bash
set -euo pipefail

workdir=$(mktemp -d)

cleanup() {
    rm -rf "$workdir"
    echo "cleaned up $workdir"
}
trap cleanup EXIT

echo "working in $workdir"
for i in 1 2 3; do
    echo "line $i" > "$workdir/file_$i.txt"
done
ls "$workdir" | wc -l | xargs echo "files created:"
cat "$workdir"/file_*.txt
