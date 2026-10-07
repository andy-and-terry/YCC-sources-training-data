#!/usr/bin/env bash
set -euo pipefail

# Prices in cents. Each SKU has name, qty, price and reorder level.
declare -A name=() qty=() price=() reorder=()
log=()

add_item() { name[$1]=$2; qty[$1]=$3; price[$1]=$4; reorder[$1]=${5:-5}; }

require() { [[ -n ${name[$1]:-} ]] || { echo "error: unknown sku $1" >&2; return 1; }; }

restock() { require "$1"; qty[$1]=$((qty[$1] + $2)); log+=("+$2 $1"); }

# Sets REVENUE to the sale amount in cents.
sell() {
    require "$1"
    if ((qty[$1] < $2)); then echo "error: only ${qty[$1]} $1 left" >&2; return 1; fi
    qty[$1]=$((qty[$1] - $2)); log+=("-$2 $1")
    REVENUE=$((REVENUE + $2 * price[$1]))
}

money() { printf '%d.%02d' $(($1 / 100)) $(($1 % 100)); }

add_item A100 Widget 20 250
add_item B200 Gadget 4 1200 3
add_item C300 Doohickey 8 725 10
REVENUE=0
sell A100 16
sell B200 2
restock C300 5
sell B200 10 2>&1 || true

value=0 low=()
for sku in $(printf '%s\n' "${!name[@]}" | sort); do
    printf '%-5s %-10s %3d @ %6s\n' "$sku" "${name[$sku]}" "${qty[$sku]}" "$(money "${price[$sku]}")"
    value=$((value + qty[$sku] * price[$sku]))
    ((qty[$sku] <= reorder[$sku])) && low+=("$sku")
done
echo "revenue=$(money "$REVENUE") stock value=$(money "$value") low stock: ${low[*]}"
echo "log: ${log[*]}"
