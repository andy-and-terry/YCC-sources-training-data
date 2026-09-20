#!/usr/bin/env bash
set -euo pipefail

# A coprocess runs a command in the background with pipes wired up as
# COPROC[0] (read from it) and COPROC[1] (write to it).
coproc WORKER {
    while IFS= read -r line; do
        echo "processed: ${line^^}"
    done
}

echo "one" >&"${WORKER[1]}"
echo "two" >&"${WORKER[1]}"
echo "three" >&"${WORKER[1]}"

for _ in 1 2 3; do
    IFS= read -r reply <&"${WORKER[0]}"
    echo "$reply"
done

exec {WORKER[1]}>&-
wait "$WORKER_PID"
