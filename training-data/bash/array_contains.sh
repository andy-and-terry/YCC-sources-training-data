#!/usr/bin/env bash
# Membership test for an indexed array.
contains() {
    local needle=$1; shift
    local item
    for item in "$@"; do
        [[ $item == "$needle" ]] && return 0
    done
    return 1
}
fruits=(apple banana cherry)
for f in banana grape; do
    if contains "$f" "${fruits[@]}"; then echo "$f: yes"; else echo "$f: no"; fi
done
