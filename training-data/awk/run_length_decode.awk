#!/usr/bin/awk -f
# Decode strings such as "3a2b1c" into "aaabbc".
function decode(s,    out, n, c) {
    out = ""
    while (match(s, /^[0-9]+/)) {
        n = substr(s, 1, RLENGTH) + 0
        c = substr(s, RLENGTH + 1, 1)
        s = substr(s, RLENGTH + 2)
        while (n-- > 0) out = out c
    }
    return out
}
{ print decode($0) }
