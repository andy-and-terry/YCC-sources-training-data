#!/usr/bin/env bash
set -euo pipefail

# Min-priority queue backed by a binary heap stored in an array.
pq_push() {
    local -n heap_ref=$1
    local value=$2
    heap_ref+=("$value")
    local i=$((${#heap_ref[@]} - 1))
    while ((i > 0)); do
        local parent=$((( (i - 1) / 2 )))
        if ((heap_ref[parent] <= heap_ref[i])); then
            break
        fi
        local tmp=${heap_ref[parent]}
        heap_ref[parent]=${heap_ref[i]}
        heap_ref[i]=$tmp
        i=$parent
    done
}

pq_pop() {
    local -n heap_ref=$1
    local -n result_ref=$2
    result_ref=${heap_ref[0]}
    local last=$((${#heap_ref[@]} - 1))
    heap_ref[0]=${heap_ref[last]}
    unset 'heap_ref[last]'
    heap_ref=("${heap_ref[@]}")

    local i=0
    local size=${#heap_ref[@]}
    while true; do
        local left=$((i * 2 + 1))
        local right=$((i * 2 + 2))
        local smallest=$i
        if ((left < size)) && ((heap_ref[left] < heap_ref[smallest])); then
            smallest=$left
        fi
        if ((right < size)) && ((heap_ref[right] < heap_ref[smallest])); then
            smallest=$right
        fi
        if ((smallest == i)); then
            break
        fi
        local tmp=${heap_ref[i]}
        heap_ref[i]=${heap_ref[smallest]}
        heap_ref[smallest]=$tmp
        i=$smallest
    done
}

heap=()
for value in 5 2 9 1 5 6 3; do
    pq_push heap "$value"
done

result=""
sorted=()
while ((${#heap[@]} > 0)); do
    pq_pop heap result
    sorted+=("$result")
done
echo "${sorted[@]}"
