#!/usr/bin/awk -f
# Print each character of the line with its code point
BEGIN {
    for (i = 0; i < 256; i++) ord[sprintf("%c", i)] = i
}
{
    for (i = 1; i <= length($0); i++) {
        c = substr($0, i, 1)
        printf "%s:%02x ", c, ord[c]
    }
    print ""
}
