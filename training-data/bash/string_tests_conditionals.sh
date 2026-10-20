#!/usr/bin/env bash
set -euo pipefail

s="Hello123"
[[ $s == Hello* ]] && echo prefix
[[ $s =~ ^[A-Za-z]+([0-9]+)$ ]] && echo "digits=${BASH_REMATCH[1]}"
[[ -z "" && -n "$s" ]] && echo "empty and nonempty"
[[ 10 -gt 9 && "10" < "9" ]] && echo "numeric vs lexical"
f=$(mktemp); [[ -f $f && -s $f ]] || echo "empty file"; rm -f "$f"
[[ -d /tmp && -w /tmp ]] && echo "tmp writable"
case "$s" in
  [A-Z]*[0-9]) echo "matches" ;;
  *) echo "no" ;;
esac
