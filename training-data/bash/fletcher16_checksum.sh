#!/usr/bin/env bash
fletcher16() {
  local s=$1 s1=0 s2=0 i b
  for ((i = 0; i < ${#s}; i++)); do
    printf -v b '%d' "'${s:i:1}"
    s1=$(((s1 + b) % 255))
    s2=$(((s2 + s1) % 255))
  done
  printf '%x\n' $(((s2 << 8) | s1))
}

fletcher16 "abcde"
