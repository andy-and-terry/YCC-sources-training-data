#!/usr/bin/env bash
set -euo pipefail

options=("start" "stop" "restart")

for i in "${!options[@]}"; do
    echo "$((i + 1))) ${options[$i]}"
done
