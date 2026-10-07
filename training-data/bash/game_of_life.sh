#!/usr/bin/env bash
set -euo pipefail

rows=6 cols=8
cells=(
    '.#......'
    '..#.....'
    '###.....'
    '........'
    '........'
    '........'
)

step() {
    local r c dr dc n nr nc row next=()
    for ((r = 0; r < rows; r++)); do
        row=''
        for ((c = 0; c < cols; c++)); do
            n=0
            for dr in -1 0 1; do
                for dc in -1 0 1; do
                    ((dr == 0 && dc == 0)) && continue
                    nr=$(((r + dr + rows) % rows)); nc=$(((c + dc + cols) % cols))
                    [[ ${cells[nr]:nc:1} == '#' ]] && n=$((n + 1))
                done
            done
            if ((n == 3)) || { ((n == 2)) && [[ ${cells[r]:c:1} == '#' ]]; }; then row+='#'; else row+='.'; fi
        done
        next+=("$row")
    done
    cells=("${next[@]}")
}

for gen in 0 1 2 3 4; do
    echo "gen $gen"
    printf '%s\n' "${cells[@]}"
    step
done
