#!/usr/bin/env bash
set -euo pipefail

queue=()

enqueue() {
    queue+=("$1")
}

dequeue() {
    local value=${queue[0]}
    queue=("${queue[@]:1}")
    echo "$value"
}

enqueue 1
enqueue 2
enqueue 3
dequeue
dequeue
