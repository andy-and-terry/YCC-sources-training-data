#!/usr/bin/env bash
set -euo pipefail

# Custom file descriptors and stderr/stdout juggling.
out=$(mktemp)
exec 3>"$out"
echo "written to fd 3" >&3
exec 3>&-
cat "$out"
rm -f "$out"

# Swap stdout and stderr: capture only the stderr text.
captured=$({ echo "to stdout"; echo "to stderr" >&2; } 2>&1 1>/dev/null)
echo "captured: $captured"
