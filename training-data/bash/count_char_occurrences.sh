#!/usr/bin/env bash
# Count how many times a character occurs in a string.
count_char() {
    local str=$1 ch=$2
    local stripped=${str//"$ch"/}
    echo $(( ${#str} - ${#stripped} ))
}
echo "l in hello world: $(count_char "hello world" l)"
echo "a in banana: $(count_char banana a)"
echo "z in banana: $(count_char banana z)"
