#!/usr/bin/env bash
set -euo pipefail

describe_num() {
    local n=$1
    case $n in
        0) echo "zero" ;;&
        [0-9]) echo "single digit" ;;&
        [02468]) echo "even" ;;
        [13579]) echo "odd" ;;
        *) echo "multi-digit" ;;
    esac
}

describe_num 0
describe_num 4
describe_num 7
describe_num 42
