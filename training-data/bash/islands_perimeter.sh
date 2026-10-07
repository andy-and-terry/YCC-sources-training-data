#!/usr/bin/env bash
set -euo pipefail

grid=(
    '01001'
    '11101'
    '01000'
    '11011'
)
rows=${#grid[@]} cols=${#grid[0]}

cell() { (($1 < 0 || $2 < 0 || $1 >= rows || $2 >= cols)) && { echo 0; return; }; echo "${grid[$1]:$2:1}"; }
mark() { grid[$1]=${grid[$1]:0:$2}2${grid[$1]:$2+1}; }

results=()
for ((r = 0; r < rows; r++)); do
    for ((c = 0; c < cols; c++)); do
        [[ ${grid[r]:c:1} == 1 ]] || continue
        area=0 perim=0 stack=("$r $c")
        mark "$r" "$c"
        while ((${#stack[@]})); do
            read -r y x <<<"${stack[-1]}"; unset 'stack[-1]'
            area=$((area + 1))
            for d in "1 0" "-1 0" "0 1" "0 -1"; do
                read -r dy dx <<<"$d"
                ny=$((y + dy)) nx=$((x + dx))
                v=$(cell "$ny" "$nx")
                if [[ $v == 0 ]]; then perim=$((perim + 1))
                elif [[ $v == 1 ]]; then mark "$ny" "$nx"; stack+=("$ny $nx"); fi
            done
        done
        results+=("area $area/perimeter $perim")
    done
done
echo "${#results[@]} islands:"
printf '  %s\n' "${results[@]}"
