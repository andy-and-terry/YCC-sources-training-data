#!/usr/bin/env bash
set -euo pipefail

cycle_sort() {
    local -n a=$1
    local n=${#a[@]} start item pos i t writes=0
    for ((start = 0; start < n - 1; start++)); do
        item=${a[start]}
        pos=$start
        for ((i = start + 1; i < n; i++)); do ((a[i] < item)) && pos=$((pos + 1)); done
        ((pos == start)) && continue
        while ((a[pos] == item)); do pos=$((pos + 1)); done
        t=${a[pos]}; a[pos]=$item; item=$t; writes=$((writes + 1))
        while ((pos != start)); do
            pos=$start
            for ((i = start + 1; i < n; i++)); do ((a[i] < item)) && pos=$((pos + 1)); done
            while ((a[pos] == item)); do pos=$((pos + 1)); done
            t=${a[pos]}; a[pos]=$item; item=$t; writes=$((writes + 1))
        done
    done
    echo "writes: $writes"
}

data=(20 40 50 10 30 20 0)
cycle_sort data
echo "${data[*]}"
