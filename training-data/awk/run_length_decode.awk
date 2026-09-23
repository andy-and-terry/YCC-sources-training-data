#!/usr/bin/awk -f
# Decodes a run-length-encoded line, e.g. a3b2c1 -> aaabbc
{
    line = $0
    out = ""
    n = length(line)
    i = 1
    while (i <= n) {
        c = substr(line, i, 1)
        i++
        digits = ""
        while (i <= n && substr(line, i, 1) ~ /[0-9]/) {
            digits = digits substr(line, i, 1)
            i++
        }
        count = digits + 0
        for (j = 0; j < count; j++) out = out c
    }
    print out
}
