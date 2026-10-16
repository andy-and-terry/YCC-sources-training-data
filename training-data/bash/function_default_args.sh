#!/usr/bin/env bash
# Default argument values and required-argument errors.
greet() {
    local name=${1:?name required}
    local greeting=${2:-Hello}
    echo "$greeting, $name!"
}
greet World
greet Bash Howdy
(greet) 2>&1 || echo "missing arg detected (status $?)"
