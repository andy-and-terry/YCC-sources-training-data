#!/usr/bin/env bash
set -euo pipefail

count=0
( count=10; echo "in subshell: $count" )
echo "after subshell: $count"

{ count=20; echo "in group: $count"; }
echo "after group: $count"

# A pipeline's last stage runs in a subshell by default.
total=0
printf '1\n2\n3\n' | while read -r n; do ((total += n)) || true; done
echo "total after pipe: $total"
