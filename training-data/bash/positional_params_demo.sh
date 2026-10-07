#!/usr/bin/env bash
set -euo pipefail

show_args() {
    echo "count: $#"
    echo "all as one word (\$*): $*"
    echo "all as separate words (\"\$@\"):"
    for arg in "$@"; do
        echo "  [$arg]"
    done
    shift
    echo "after shift, first arg: ${1:-none}"
}

show_args "hello world" foo bar
