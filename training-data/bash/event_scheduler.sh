#!/usr/bin/env bash
set -euo pipefail

# Discrete-event simulation. Events are "time seq name" lines kept sorted by sort(1).
queue=()
seq=0 now=0 ticks=0

schedule_at() { queue+=("$(printf '%06d %06d %s' "$1" "$seq" "$2")"); seq=$((seq + 1)); }
schedule_after() { schedule_at $((now + $1)) "$2"; }

handle() {
    case $1 in
        heartbeat) ticks=$((ticks + 1)); ((ticks < 4)) && schedule_after 30 heartbeat ;;
        'email-digest') schedule_after 5 email-sent ;;
    esac
    return 0
}

run_until() {
    local limit=$1 t name
    while ((${#queue[@]})); do
        mapfile -t queue < <(printf '%s\n' "${queue[@]}" | sort)
        read -r t _ name <<<"${queue[0]}"
        t=$((10#$t))
        ((t > limit)) && break
        queue=("${queue[@]:1}")
        now=$t
        printf 't=%3d  %s\n' "$now" "$name"
        handle "$name"
    done
}

schedule_at 0 heartbeat
schedule_at 45 backup
schedule_at 10 email-digest
schedule_at 45 report
run_until 100
