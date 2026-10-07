#!/usr/bin/env bash
set -euo pipefail

readonly MAX_RETRIES=3
readonly APP_NAME="widget-service"

echo "$APP_NAME will retry up to $MAX_RETRIES times"

if (readonly MAX_RETRIES=5) 2>/dev/null; then
    echo "reassigned"
else
    echo "MAX_RETRIES is read-only, reassignment blocked"
fi
