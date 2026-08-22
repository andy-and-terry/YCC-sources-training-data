#!/usr/bin/env bash
set -euo pipefail

s="one,two,three"
IFS=',' read -ra parts <<< "$s"
for part in "${parts[@]}"; do
    echo "$part"
done
