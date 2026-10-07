#!/usr/bin/env bash
set -euo pipefail

# Full justification: spread extra spaces left-first; last line left-aligned.
justify() {
    local width=$1; shift
    local words=("$@") i=0 j len gaps spaces line k pad
    while ((i < ${#words[@]})); do
        j=$i len=0
        while ((j < ${#words[@]})) && ((len + ${#words[j]} + j - i <= width)); do
            len=$((len + ${#words[j]})); j=$((j + 1))
        done
        gaps=$((j - i - 1)) line=${words[i]}
        if ((j == ${#words[@]} || gaps == 0)); then
            for ((k = i + 1; k < j; k++)); do line+=" ${words[k]}"; done
            printf '|%-*s|\n' "$width" "$line"
        else
            spaces=$((width - len))
            for ((k = i + 1; k < j; k++)); do
                pad=$((spaces / gaps + (k - i - 1 < spaces % gaps ? 1 : 0)))
                line+=$(printf '%*s' "$pad" '')${words[k]}
            done
            echo "|$line|"
        fi
        i=$j
    done
}

# shellcheck disable=SC2046
justify 16 $(echo "This is an example of text justification.")
echo
# shellcheck disable=SC2046
justify 20 $(echo "Science is what we understand well enough to explain to a computer.")
