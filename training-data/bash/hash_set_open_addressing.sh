#!/usr/bin/env bash
set -euo pipefail

# Open-addressing hash set with linear probing and tombstones.
# Slot states: '' = empty, $'\x01' = tombstone, anything else = key.
TOMB=$'\x01'
cap=8 size=0 used=0
slots=()

fnv1a() {
    local s=$1 h=2166136261 i c
    for ((i = 0; i < ${#s}; i++)); do
        printf -v c '%d' "'${s:i:1}"
        h=$(((h ^ c) * 16777619 & 0xFFFFFFFF))
    done
    echo "$h"
}

# Sets FOUND (0/1) and SLOT (match, or first reusable slot).
find_slot() {
    local key=$1 i tomb=-1 v
    i=$(($(fnv1a "$key") % cap))
    while v=${slots[i]:-}; [[ -n $v ]]; do
        if [[ $v == "$TOMB" ]]; then ((tomb < 0)) && tomb=$i
        elif [[ $v == "$key" ]]; then FOUND=1; SLOT=$i; return; fi
        i=$(((i + 1) % cap))
    done
    FOUND=0; SLOT=$((tomb >= 0 ? tomb : i))
}

resize() {
    local old=("${slots[@]}") k
    cap=$((cap * 2)); slots=(); size=0; used=0
    for k in "${old[@]}"; do [[ -n $k && $k != "$TOMB" ]] && add "$k"; done
    return 0
}

add() {
    (((used + 1) * 4 > cap * 3)) && resize
    find_slot "$1"
    ((FOUND)) && return 0
    [[ -z ${slots[SLOT]:-} ]] && used=$((used + 1))
    slots[SLOT]=$1
    size=$((size + 1))
}

remove() { find_slot "$1"; if ((FOUND)); then slots[SLOT]=$TOMB; size=$((size - 1)); fi; }
contains() { find_slot "$1"; echo "$FOUND"; }

for w in apple banana cherry date elderberry fig grape apple; do add "$w"; done
remove banana
echo "size=$size contains(cherry)=$(contains cherry) contains(banana)=$(contains banana) capacity=$cap"
keys=()
for k in "${slots[@]}"; do [[ -n $k && $k != "$TOMB" ]] && keys+=("$k"); done
printf '%s\n' "${keys[@]}" | sort | tr '\n' ' '; echo
