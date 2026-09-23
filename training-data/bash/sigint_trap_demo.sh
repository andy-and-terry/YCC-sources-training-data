#!/usr/bin/env bash
set -euo pipefail

interrupted=0
on_interrupt() {
    interrupted=1
    echo "caught SIGINT, finishing current step..."
}

trap on_interrupt INT

for i in 1 2 3; do
    if ((interrupted)); then
        echo "stopping early after interrupt"
        break
    fi
    echo "step $i"
    if ((i == 2)); then
        kill -INT $$
    fi
done

trap - INT
echo "done"
