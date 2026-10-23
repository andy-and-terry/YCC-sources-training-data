#!/usr/bin/env bash
# EPOCHSECONDS, EPOCHREALTIME and SECONDS for timing, no external date call

fmt_duration() {
    local total=$1
    printf '%02d:%02d:%02d\n' $((total / 3600)) $((total % 3600 / 60)) $((total % 60))
}

echo "durations:"
fmt_duration 59
fmt_duration 3661
fmt_duration 86399

start=$EPOCHSECONDS
start_real=$EPOCHREALTIME
SECONDS=0
sleep 1
elapsed=$((EPOCHSECONDS - start))
echo "EPOCHSECONDS delta: >=1 ? $([[ $elapsed -ge 1 ]] && echo yes || echo no)"
echo "SECONDS counter:    >=1 ? $([[ $SECONDS -ge 1 ]] && echo yes || echo no)"

# EPOCHREALTIME is "seconds.microseconds"; strip the dot for integer math
now_real=$EPOCHREALTIME
us=$(( ${now_real/./} - ${start_real/./} ))
echo "microsecond delta >= 1000000 ? $([[ $us -ge 1000000 ]] && echo yes || echo no)"

printf 'formatted now: %(%Y)T is at least 2024? %s\n' -1 \
    "$([[ $(printf '%(%Y)T' -1) -ge 2024 ]] && echo yes || echo no)"
