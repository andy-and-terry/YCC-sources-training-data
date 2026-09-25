#!/usr/bin/env bash
set -euo pipefail

decode() {
  tr '[:upper:]' '[:lower:]' <<<"$1" | tr -cd 'a-z0-9' | tr 'a-z' 'zyxwvutsrqponmlkjihgfedcba'
}

encode() {
  decode "$1" | fold -w5 | paste -sd' '
}

e=$(encode "The quick brown fox")
echo "$e -> $(decode "$e")"
