#!/usr/bin/awk -f
# Applies the ROT13 substitution cipher to each line of input.
function rot13(s,    i, c, out, code) {
    out = ""
    for (i = 1; i <= length(s); i++) {
        c = substr(s, i, 1)
        code = index("ABCDEFGHIJKLMNOPQRSTUVWXYZ", c)
        if (code > 0) {
            out = out substr("ABCDEFGHIJKLMNOPQRSTUVWXYZ", (code + 12) % 26 + 1, 1)
            continue
        }
        code = index("abcdefghijklmnopqrstuvwxyz", c)
        if (code > 0) {
            out = out substr("abcdefghijklmnopqrstuvwxyz", (code + 12) % 26 + 1, 1)
            continue
        }
        out = out c
    }
    return out
}
{
    print rot13($0)
}
