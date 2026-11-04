#!/usr/bin/env bash
second_largest() {
  printf '%s\n' "$@" | sort -rn | uniq | sed -n '2p'
}

second_largest 4 9 2 9 7
