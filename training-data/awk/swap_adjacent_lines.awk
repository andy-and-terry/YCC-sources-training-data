#!/usr/bin/awk -f
# Swaps each pair of consecutive lines (1<->2, 3<->4, ...).
NR % 2 == 1 { held = $0; next }
{ print $0; print held; held = "" }
END {
    if (NR % 2 == 1) print held
}
