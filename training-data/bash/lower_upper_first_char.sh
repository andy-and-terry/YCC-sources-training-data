#!/usr/bin/env bash
# Capitalize the first letter of each word using parameter expansion.
capitalize() {
    local word out=""
    for word in $1; do
        out+="${word^} "
    done
    echo "${out% }"
}
capitalize "the quick brown fox"
capitalize "hello world from bash"
