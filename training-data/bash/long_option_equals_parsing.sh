#!/usr/bin/env bash
set -euo pipefail

parse_args() {
    local name="world"
    local count=1
    local arg

    for arg in "$@"; do
        case $arg in
            --name=*)
                name="${arg#*=}"
                ;;
            --count=*)
                count="${arg#*=}"
                ;;
            *)
                echo "unknown argument: $arg" >&2
                ;;
        esac
    done

    local i
    for ((i = 0; i < count; i++)); do
        echo "Hello, $name!"
    done
}

parse_args --name=Ada --count=2
