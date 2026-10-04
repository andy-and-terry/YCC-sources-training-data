#!/usr/bin/env bash
set -euo pipefail

# Trim whitespace using only parameter expansion (no sed/awk forks)
trim() {
    local s=$1
    s="${s#"${s%%[![:space:]]*}"}"   # strip leading
    s="${s%"${s##*[![:space:]]}"}"   # strip trailing
    printf '%s' "$s"
}

echo "[$(trim '   hello world   ')]"
echo "[$(trim $'\t tabbed \n')]"
echo "[$(trim '')]"

# Prefix and suffix removal
path="/usr/local/lib/libfoo.so.1.2"
echo "${path##*/}"        # basename: libfoo.so.1.2
echo "${path%/*}"         # dirname: /usr/local/lib
echo "${path%%.*}"        # longest suffix: /usr/local/lib/libfoo
echo "${path#*.}"         # shortest prefix removal: so.1.2

# Replace
s="a-b-c-d"
echo "${s/-/_}"           # first only
echo "${s//-/_}"          # all
echo "${s/#a/A}"          # anchored at start
echo "${s/%d/D}"          # anchored at end

# Substring and length
w="abcdefgh"
echo "${w:2:3} ${w: -2} ${#w}"
