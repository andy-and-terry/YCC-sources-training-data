#!/usr/bin/env bash
set -euo pipefail

work() {
    local id=$1
    sleep 0.05
    echo "job $id done"
}

pids=()
for i in 1 2 3; do
    work "$i" &
    pids+=($!)
done

for pid in "${pids[@]}"; do
    wait "$pid"
done

echo "all jobs complete"
