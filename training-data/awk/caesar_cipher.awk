#!/usr/bin/awk -f
# Encrypts each line with a Caesar cipher shift (lowercase letters only).
BEGIN {
    shift = 3
    split("abcdefghijklmnopqrstuvwxyz", letters, "")
    for (i = 1; i <= 26; i++) {
        pos[letters[i]] = i
    }
}
{
    out = ""
    n = length($0)
    for (i = 1; i <= n; i++) {
        c = substr($0, i, 1)
        if (c in pos) {
            new_pos = (pos[c] - 1 + shift) % 26 + 1
            out = out letters[new_pos]
        } else {
            out = out c
        }
    }
    print out
}
