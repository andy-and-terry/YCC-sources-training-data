#!/usr/bin/env bash
set -euo pipefail

export GREETING="Hello"

show_greeting() {
    echo "$GREETING, from a subshell!"
}

(show_greeting)

: "${UNSET_VAR:=default_value}"
echo "$UNSET_VAR"
