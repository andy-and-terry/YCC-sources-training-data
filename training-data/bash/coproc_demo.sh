#!/usr/bin/env bash
set -euo pipefail

coproc worker { cat; }

echo "ping-1" >&"${worker[1]}"
read -r reply <&"${worker[0]}"
echo "worker echoed: $reply"

echo "ping-2" >&"${worker[1]}"
read -r reply <&"${worker[0]}"
echo "worker echoed: $reply"

exec {worker[1]}>&-
wait "$worker_PID"
