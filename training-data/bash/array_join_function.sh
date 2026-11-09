#!/usr/bin/env bash
join_by() {
    local IFS="$1"; shift
    echo "$*"
}
join_by , a b c
join_by ' | ' x y z
