#!/usr/bin/env bash
# Split an array into fixed-size chunks.
chunk() {
    local size=$1; shift
    local i
    for ((i = 0; i < $#; i += size)); do
        echo "[${*:i+1:size}]"
    done
}
chunk 3 1 2 3 4 5 6 7 8
