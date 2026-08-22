#!/usr/bin/env bash
set -euo pipefail

classify_status() {
    local code=$1
    case $code in
        2??) echo "success" ;;
        3??) echo "redirect" ;;
        4??) echo "client error" ;;
        5??) echo "server error" ;;
        *) echo "unknown" ;;
    esac
}

for code in 200 301 404 503 999; do
    echo "$code: $(classify_status "$code")"
done
