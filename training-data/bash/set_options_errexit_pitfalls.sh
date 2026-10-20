#!/usr/bin/env bash
set -euo pipefail

false || true
echo "after tolerated failure"
if ! grep -q zzz <<< "abc"; then echo "grep failed inside if is fine"; fi
count=$(grep -c zzz <<< "abc" || true)
echo "count=$count"
set +e; false; echo "rc=$? (errexit off)"; set -e
out=$(printf 'a\nb\n' | head -1); echo "$out"
