#!/usr/bin/env bash
set -euo pipefail

# Balances are kept in cents to avoid floating point.
declare -A balance=()
history=()

open_account() { balance[$1]=${2:-0}; }

deposit() {
    local who=$1 amt=$2
    ((amt > 0)) || { echo "error: amount must be positive" >&2; return 1; }
    ((balance[$who] += amt))
    history+=("$who +$amt")
}

withdraw() {
    local who=$1 amt=$2
    if ((amt > balance[$who])); then
        echo "error: insufficient funds for $who" >&2
        return 1
    fi
    ((balance[$who] -= amt))
    history+=("$who -$amt")
}

transfer() { withdraw "$1" "$3" && deposit "$2" "$3"; }

fmt() { printf '%d.%02d' $(($1 / 100)) $(($1 % 100)); }

open_account alice 10000
open_account bob
deposit alice 5000
withdraw alice 3000
transfer alice bob 7000
withdraw bob 50000 2>&1 || true
echo "alice=$(fmt "${balance[alice]}") bob=$(fmt "${balance[bob]}")"
printf '%s\n' "${history[@]}"
