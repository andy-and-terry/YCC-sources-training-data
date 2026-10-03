#!/usr/bin/env bash
set -euo pipefail

# -s suppresses terminal echo so the input isn't shown as it's typed.
echo "hunter2" | { read -r -s -p "Enter password: " password; echo; echo "Password length: ${#password}"; }
