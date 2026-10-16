#!/usr/bin/awk -f
# Bitwise AND/OR/XOR without gawk extensions
function bitop(a, b, op,   r, p, x, y) {
    r = 0; p = 1
    while (a > 0 || b > 0) {
        x = a % 2; y = b % 2
        if (op == "and" && x && y) r += p
        else if (op == "or" && (x || y)) r += p
        else if (op == "xor" && x != y) r += p
        a = int(a / 2); b = int(b / 2); p *= 2
    }
    return r
}
BEGIN {
    print bitop(12, 10, "and")
    print bitop(12, 10, "or")
    print bitop(12, 10, "xor")
}
