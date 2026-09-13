#!/usr/bin/env bash
set -euo pipefail

ini_content="[server]
host = localhost
port = 8080

[client]
timeout = 30"

declare -A config
section=""
while IFS= read -r line; do
    if [[ $line =~ ^\[(.+)\]$ ]]; then
        section="${BASH_REMATCH[1]}"
    elif [[ $line == *"="* ]]; then
        key="${line%%=*}"
        value="${line#*=}"
        key="$(echo "$key" | xargs)"
        value="$(echo "$value" | xargs)"
        config["$section.$key"]="$value"
    fi
done <<< "$ini_content"

for key in "${!config[@]}"; do
    echo "$key = ${config[$key]}"
done | sort
