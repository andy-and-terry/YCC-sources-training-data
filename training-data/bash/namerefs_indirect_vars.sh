#!/usr/bin/env bash
set -euo pipefail

set_var() { local -n ref=$1; ref="set by function"; }
set_var result
echo "$result"
color=blue; name=color
echo "${!name}"
declare -a fruits=(a b)
append() { local -n arr=$1; arr+=("$2"); }
append fruits c
echo "${fruits[@]}"
