#!/usr/bin/env bash
set -uo pipefail

check_command() {
    if "$@"; then
        echo "succeeded"
    else
        echo "failed with code $?"
    fi
}

check_command true
check_command false
