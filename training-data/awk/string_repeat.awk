#!/usr/bin/awk -f
function repeat(s, n,    out) {
    out = ""
    while (n-- > 0) out = out s
    return out
}
BEGIN {
    print repeat("ab", 3)
    print repeat("-", 20)
    for (i = 1; i <= 4; i++)
        print repeat(" ", 4 - i) repeat("*", 2 * i - 1)
}
