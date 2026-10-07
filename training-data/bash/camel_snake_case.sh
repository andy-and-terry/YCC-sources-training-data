#!/usr/bin/env bash
set -euo pipefail

words() {
    sed -E 's/([a-z0-9])([A-Z])/\1 \2/g; s/([A-Z]+)([A-Z][a-z])/\1 \2/g; s/[-_ ]+/ /g' <<<"$1" |
        tr '[:upper:]' '[:lower:]'
}

to_snake() { words "$1" | tr ' ' '_'; }
to_kebab() { words "$1" | tr ' ' '-'; }
to_const() { to_snake "$1" | tr '[:lower:]' '[:upper:]'; }
to_camel() {
    local out='' w first=1
    for w in $(words "$1"); do
        if ((first)); then out=$w; first=0; else out+=${w^}; fi
    done
    echo "$out"
}

for s in 'background-color' 'XMLHttpRequest' 'user_id' 'Some Title Here'; do
    printf '%-17s camel=%-17s snake=%-18s kebab=%-18s const=%s\n' \
        "$s" "$(to_camel "$s")" "$(to_snake "$s")" "$(to_kebab "$s")" "$(to_const "$s")"
done
