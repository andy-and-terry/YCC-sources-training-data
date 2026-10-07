#!/usr/bin/env bash
set -euo pipefail

work() {
    local id=$1 delay=$2
    sleep "$delay"
    echo "job $id finished after ${delay}s"
}

work 1 0.05 &
work 2 0.02 &
work 3 0.08 &

remaining=3
while ((remaining > 0)); do
    wait -n
    remaining=$((remaining - 1))
    echo "jobs still running: $remaining"
done

echo "all jobs complete"
