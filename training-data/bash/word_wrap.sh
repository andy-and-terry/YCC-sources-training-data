#!/usr/bin/env bash
set -euo pipefail

text='The quick brown fox jumps over the lazy dog. Pack my box with five dozen liquor jugs. Supercalifragilisticexpialidocious words get split.'

# Greedy wrap; words longer than the width are hard-broken.
wrap() {
    local width=$1 line='' w
    for w in $2; do
        while ((${#w} > width)); do
            [[ -n $line ]] && { echo "$line"; line=''; }
            echo "${w:0:width}"; w=${w:width}
        done
        if [[ -z $line ]]; then line=$w
        elif ((${#line} + 1 + ${#w} <= width)); then line+=" $w"
        else echo "$line"; line=$w; fi
    done
    [[ -n $line ]] && echo "$line"
    return 0
}

echo "== greedy, width 24"
wrap 24 "$text" | sed 's/.*/|&|/'
echo "== coreutils fold -s -w 24"
fold -s -w 24 <<<"$text"
