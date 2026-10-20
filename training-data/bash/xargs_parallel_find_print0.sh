#!/usr/bin/env bash
set -euo pipefail

d=$(mktemp -d); trap 'rm -rf "$d"' EXIT
touch "$d/a b.txt" "$d/c.txt" "$d/d.log"
find "$d" -name '*.txt' -print0 | xargs -0 -n1 basename | sort
find "$d" -type f -name '*.txt' | wc -l
printf '%s\n' 1 2 3 | xargs -P2 -I{} sh -c 'echo job {}' | sort
echo "a b c" | xargs -n1
