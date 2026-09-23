#!/usr/bin/env bash
set -euo pipefail

printf -v formatted "%05d" 42
echo "$formatted"

printf -v hex "%#x" 255
echo "$hex"

printf -v padded "%-10s|" "left"
echo "$padded"

printf -v pi_str "%.3f" 3.14159
echo "$pi_str"
