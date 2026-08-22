#!/usr/bin/env bash
set -euo pipefail

text="the quick brown fox jumps over the lazy dog the fox runs"

echo "$text" \
  | tr '[:upper:]' '[:lower:]' \
  | tr -s ' ' '\n' \
  | sort \
  | uniq -c \
  | sort -rn \
  | head -3
