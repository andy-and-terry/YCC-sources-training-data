#!/usr/bin/awk -f
BEGIN {
    for (i = 0; i < 26; i++) letter[i] = substr("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i + 1, 1)
    msg = "AFFINE"; a = 5; b = 8
    for (i = 1; i <= length(msg); i++) {
        x = index("ABCDEFGHIJKLMNOPQRSTUVWXYZ", substr(msg, i, 1)) - 1
        out = out letter[(a * x + b) % 26]
    }
    print out
}
