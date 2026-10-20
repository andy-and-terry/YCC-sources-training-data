#!/usr/bin/env bash
set -uo pipefail

pids=()
for i in 1 2 3; do
  ( sleep 0.$i; exit $((i % 2)) ) &
  pids+=($!)
done
fail=0
for p in "${pids[@]}"; do wait "$p" || fail=$((fail + 1)); done
echo "failures=$fail"
sleep 5 & kill $! 2>/dev/null; wait $! 2>/dev/null; echo "killed rc=$?"
