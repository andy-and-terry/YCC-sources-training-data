#!/usr/bin/awk -f
# Removes duplicate words within each line, keeping the first occurrence of each.
{
    delete seen
    out = ""
    for (i = 1; i <= NF; i++) {
        if (!($i in seen)) {
            seen[$i] = 1
            out = out (out == "" ? "" : " ") $i
        }
    }
    print out
}
