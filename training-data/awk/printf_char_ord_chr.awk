#!/usr/bin/awk -f
# printf "%c" converts a number to its character; awk has no built-in ord(),
# so build a lookup table from the printable ASCII range.
BEGIN {
    for (i = 32; i < 127; i++)
        ord[sprintf("%c", i)] = i

    s = "Hello, AWK!"
    for (i = 1; i <= length(s); i++) {
        c = substr(s, i, 1)
        printf "%s=%d ", c, ord[c]
    }
    print ""

    # Caesar-shift using ord/chr round trips.
    out = ""
    for (i = 1; i <= length(s); i++) {
        c = substr(s, i, 1)
        if (c ~ /[a-z]/)      out = out sprintf("%c", (ord[c] - 97 + 3) % 26 + 97)
        else if (c ~ /[A-Z]/) out = out sprintf("%c", (ord[c] - 65 + 3) % 26 + 65)
        else                  out = out c
    }
    print out

    printf "%c%c%c\n", 65, 87, 75
    printf "%c\n", "Zebra"
}
