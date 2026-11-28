#!/bin/bash
reverse_bits() {
    local v=$1 r=0
    for ((i = 0; i < 8; i++)); do
        r=$(( (r << 1) | (v & 1) ))
        v=$(( v >> 1 ))
    done
    echo "$r"
}

for v in 1 6 13 128; do
    echo "$v $(reverse_bits "$v")" # 128 96 176 1
done
