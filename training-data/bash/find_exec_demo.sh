#!/usr/bin/env bash
set -euo pipefail

workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT

touch "$workdir/a.txt" "$workdir/b.txt" "$workdir/c.log"

# find + -exec runs a command against each matched path.
find "$workdir" -name '*.txt' -exec basename {} \;
