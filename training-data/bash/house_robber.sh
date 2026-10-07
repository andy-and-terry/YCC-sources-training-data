#!/usr/bin/env bash
set -euo pipefail

max() { echo $(($1 > $2 ? $1 : $2)); }

rob_line() {
    local take=0 skip=0 x t
    for x in "$@"; do t=$((skip + x)); skip=$(max "$take" "$skip"); take=$t; done
    max "$take" "$skip"
}

rob_circle() {
    (($# == 1)) && { echo "$1"; return; }
    local h=("$@")
    max "$(rob_line "${h[@]:0:$#-1}")" "$(rob_line "${h[@]:1}")"
}

echo "$(rob_line 2 7 9 3 1) $(rob_line 1 2 3 1) $(rob_circle 2 3 2) $(rob_circle 1 2 3 1)"
