#!/usr/bin/env bash
retry() {
  local n=0 max=$1; shift
  until "$@"; do
    (( ++n >= max )) && { echo "giving up" >&2; return 1; }
    sleep $((2 ** n)) 2>/dev/null || true
    echo "retry $n" >&2
  done
}
retry 3 test -e /nonexistent || echo "failed as expected"
