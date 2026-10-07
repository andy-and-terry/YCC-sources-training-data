#!/usr/bin/env bash
set -euo pipefail

grid=(
    '..###.....'
    '.#...#....'
    '.#...#.##.'
    '..###..#..'
    '.......#..'
)
rows=${#grid[@]} cols=${#grid[0]}

set_cell() { local r=$1 c=$2 ch=$3; grid[r]=${grid[r]:0:c}$ch${grid[r]:c+1}; }

# Iterative fill using an explicit stack of "r c" pairs.
flood_fill() {
    local r=$1 c=$2 new=$3 old=${grid[$1]:$2:1} filled=0
    FILLED=0
    [[ $old == "$new" ]] && return
    local stack=("$r $c")
    while ((${#stack[@]})); do
        read -r r c <<<"${stack[-1]}"
        unset 'stack[-1]'
        ((r < 0 || c < 0 || r >= rows || c >= cols)) && continue
        [[ ${grid[r]:c:1} == "$old" ]] || continue
        set_cell "$r" "$c" "$new"
        filled=$((filled + 1))
        stack+=("$((r + 1)) $c" "$((r - 1)) $c" "$r $((c + 1))" "$r $((c - 1))")
    done
    FILLED=$filled
}

flood_fill 1 2 o
printf '%s\n' "${grid[@]}"
echo "filled $FILLED cells"
