#!/usr/bin/env bash
crc8() {
  local s=$1 crc=0 i k
  for ((i = 0; i < ${#s}; i++)); do
    printf -v c '%d' "'${s:i:1}"
    crc=$((crc ^ c))
    for ((k = 0; k < 8; k++)); do
      if ((crc & 0x80)); then crc=$((((crc << 1) ^ 0x07) & 0xFF)); else crc=$(((crc << 1) & 0xFF)); fi
    done
  done
  printf '%02x\n' "$crc"
}
crc8 123456789
