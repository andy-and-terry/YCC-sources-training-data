#!/usr/bin/env bash
set -euo pipefail

echo "epoch year $(date -u -d @0 +%Y) and $(echo $(echo nested))"
files="a b"; for f in $files; do echo "[$f]"; done
for f in "$files"; do echo "[$f]"; done
arr=("x y" z); for f in "${arr[@]}"; do echo "[$f]"; done; for f in ${arr[@]}; do echo "<$f>"; done
echo 'single $no "expand"' "double \"esc\" $((1+1))" $'tab\there'
x=$(printf 'trailing\n\n\n'); echo "[${x}]"
