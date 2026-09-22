#!/usr/bin/awk -f
# Reads a CSV with a header row and prints "name=value" for a chosen column,
# looked up by header name instead of a hardcoded field number.
BEGIN {
    FS = ","
    target = "email"
}
NR == 1 {
    for (i = 1; i <= NF; i++) {
        if ($i == target) col = i
    }
    next
}
{
    print target "=" $col
}
