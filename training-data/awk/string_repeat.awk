#!/usr/bin/awk -f
# Build a repeated string by doubling (O(log n) concatenations).
function repeat(s, n,    out) {
    out = ""
    while (n > 0) {
        if (n % 2) out = out s
        s = s s
        n = int(n / 2)
    }
    return out
}
BEGIN {
    print repeat("ab", 5)
    print repeat("-", 20)
    print "[" repeat("x", 0) "]"
}
