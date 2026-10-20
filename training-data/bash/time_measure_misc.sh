#!/usr/bin/env bash
set -euo pipefail

start=$SECONDS
sleep 1
echo "elapsed >= 1: $(( SECONDS - start >= 1 ))"
echo "$RANDOM" | grep -qE '^[0-9]+$' && echo "random ok"
command -v bash >/dev/null && echo "bash on path"
(ulimit -n 64 && echo "nofile=$(ulimit -n)")
type -t cd
