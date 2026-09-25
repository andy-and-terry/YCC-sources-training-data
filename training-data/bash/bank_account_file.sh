#!/usr/bin/env bash
# Tiny bank ledger persisted to a file, guarded with flock for concurrent callers.
set -euo pipefail

ledger=$(mktemp)
trap 'rm -f "$ledger" "$ledger.lock"' EXIT
echo 0 >"$ledger"

with_lock() {
  exec 9>"$ledger.lock"
  flock 9
  "$@"
  flock -u 9
}

_deposit() { echo $(($(<"$ledger") + $1)) >"$ledger"; }
_withdraw() {
  local bal
  bal=$(<"$ledger")
  if (($1 > bal)); then echo "insufficient funds: have $bal" >&2; return 1; fi
  echo $((bal - $1)) >"$ledger"
}

deposit() { with_lock _deposit "$1"; }
withdraw() { with_lock _withdraw "$1"; }

for _ in {1..20}; do deposit 5 & done
wait
echo "balance: $(<"$ledger")"
withdraw 500 || true
withdraw 30
echo "balance: $(<"$ledger")"
