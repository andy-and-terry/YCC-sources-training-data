#!/usr/bin/env bash
# Cantor pairing function and its inverse (integer square root via awk).
pair() { echo $((($1 + $2) * ($1 + $2 + 1) / 2 + $2)); }

unpair() {
  local z=$1 w y
  w=$(awk -v z="$z" 'BEGIN { print int((sqrt(8 * z + 1) - 1) / 2) }')
  y=$((z - w * (w + 1) / 2))
  echo "$((w - y)) $y"
}

pair 3 4
unpair 32
