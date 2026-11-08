#!/usr/bin/env bash
varint() {
  local n=$1 out=()
  while ((n >= 128)); do
    out+=("$(printf '%02x' $(((n & 127) | 128)))")
    n=$((n >> 7))
  done
  out+=("$(printf '%02x' "$n")")
  echo "${out[*]}"
}
varint 300
