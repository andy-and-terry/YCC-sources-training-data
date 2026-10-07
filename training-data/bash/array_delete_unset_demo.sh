#!/usr/bin/env bash
set -euo pipefail

fruits=(apple banana cherry date elderberry)

unset 'fruits[1]'                 # remove banana, leaves a hole in the indices
echo "length: ${#fruits[@]}"
echo "indices: ${!fruits[@]}"
echo "values: ${fruits[*]}"

fruits=("${fruits[@]}")           # re-index to close the gap
echo "reindexed: ${!fruits[@]}"

# Remove elements by value
target="date"
filtered=()
for f in "${fruits[@]}"; do
    [[ $f != "$target" ]] && filtered+=("$f")
done
echo "without $target: ${filtered[*]}"

# Insert at a position using slices
filtered=("${filtered[@]:0:1}" "fig" "${filtered[@]:1}")
echo "with fig: ${filtered[*]}"

# Associative arrays
declare -A ages=([ann]=30 [bob]=25 [cy]=41)
unset 'ages[bob]'
for k in "${!ages[@]}"; do echo "$k=${ages[$k]}"; done | sort
echo "has bob: $([[ -v ages[bob] ]] && echo yes || echo no)"
