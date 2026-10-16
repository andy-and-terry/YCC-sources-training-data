#!/usr/bin/env bash
# Rotate an array left by k positions.
rotate_left() {
    local k=$1; shift
    local arr=("$@") n=$#
    k=$(( k % n ))
    echo "${arr[@]:k} ${arr[@]:0:k}"
}
rotate_left 2 1 2 3 4 5
rotate_left 7 a b c d
