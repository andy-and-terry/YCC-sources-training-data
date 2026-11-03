#!/usr/bin/env bash
modes() {
  printf '%s\n' "$@" | sort -n | uniq -c | sort -k1,1nr -k2,2n |
    awk 'NR == 1 { top = $1 } $1 == top { printf "%s ", $2 } END { print "" }'
}

modes 1 2 2 3 3 4
