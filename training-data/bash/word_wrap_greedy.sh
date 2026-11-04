#!/usr/bin/env bash
wrap() {
  local width=$1 line="" word; shift
  for word in "$@"; do
    if [[ -n $line && $((${#line} + 1 + ${#word})) -gt $width ]]; then
      printf '|%-*s|\n' "$width" "$line"
      line=$word
    else
      line="${line:+$line }$word"
    fi
  done
  [[ -n $line ]] && printf '|%-*s|\n' "$width" "$line"
}

wrap 15 the quick brown fox jumps over the lazy dog
