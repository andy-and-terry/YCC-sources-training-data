#!/usr/bin/env bash
# Safely quote arbitrary strings for reuse with printf %q and eval
quote_args() {
  local out=""
  for a in "$@"; do out+=" $(printf '%q' "$a")"; done
  printf '%s\n' "${out# }"
}

quoted=$(quote_args "hello world" 'a"b' "it's")
echo "quoted: $quoted"
eval "set -- $quoted"
echo "argc=$#"
for a in "$@"; do echo "[$a]"; done
