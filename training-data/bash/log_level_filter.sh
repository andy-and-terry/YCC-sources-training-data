#!/usr/bin/env bash
set -euo pipefail

declare -A level=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3)
min=${1:-WARN}

while IFS= read -r line; do
    lvl=${line%%[[:space:]]*}
    if [[ -n ${level[$lvl]:-} ]] && ((level[$lvl] >= level[$min])); then
        echo "$line"
    fi
done <<'LOG'
DEBUG starting up
INFO listening on port 8080
WARN disk usage at 91%
ERROR connection refused
INFO request served
LOG
