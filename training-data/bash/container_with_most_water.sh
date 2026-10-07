#!/usr/bin/env bash
set -euo pipefail

max_area() {
    local h=("$@") l=0 r=$(($# - 1)) best=0 bl=0 br=0 area lo
    while ((l < r)); do
        lo=$((h[l] < h[r] ? h[l] : h[r]))
        area=$(((r - l) * lo))
        if ((area > best)); then best=$area; bl=$l; br=$r; fi
        if ((h[l] < h[r])); then l=$((l + 1)); else r=$((r - 1)); fi
    done
    echo "max area $best between $bl and $br"
}

max_area 1 8 6 2 5 4 8 3 7
