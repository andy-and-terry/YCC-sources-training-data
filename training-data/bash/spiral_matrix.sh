#!/usr/bin/env bash
set -euo pipefail

# Matrix stored row-major in a flat array.
rows=4 cols=4
m=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16)

spiral() {
    local top=0 bottom=$((rows - 1)) left=0 right=$((cols - 1)) i out=()
    while ((top <= bottom && left <= right)); do
        for ((i = left; i <= right; i++)); do out+=("${m[top * cols + i]}"); done
        top=$((top + 1))
        for ((i = top; i <= bottom; i++)); do out+=("${m[i * cols + right]}"); done
        right=$((right - 1))
        if ((top <= bottom)); then
            for ((i = right; i >= left; i--)); do out+=("${m[bottom * cols + i]}"); done
            bottom=$((bottom - 1))
        fi
        if ((left <= right)); then
            for ((i = bottom; i >= top; i--)); do out+=("${m[i * cols + left]}"); done
            left=$((left + 1))
        fi
    done
    echo "${out[*]}"
}

spiral
rows=3 cols=4 m=(1 2 3 4 5 6 7 8 9 10 11 12)
spiral
