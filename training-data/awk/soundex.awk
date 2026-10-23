#!/usr/bin/awk -f
# American Soundex code for a name: first letter plus three digits
function code(ch) {
    if (index("BFPV", ch)) return 1
    if (index("CGJKQSXZ", ch)) return 2
    if (index("DT", ch)) return 3
    if (ch == "L") return 4
    if (index("MN", ch)) return 5
    if (ch == "R") return 6
    return 0                      # vowels, H, W, Y
}
function soundex(name,    s, out, i, ch, c, prev) {
    s = toupper(name)
    gsub(/[^A-Z]/, "", s)
    if (s == "") return ""
    out = substr(s, 1, 1)
    prev = code(out)
    for (i = 2; i <= length(s) && length(out) < 4; i++) {
        ch = substr(s, i, 1)
        c = code(ch)
        if (c != 0 && c != prev) out = out c
        if (ch != "H" && ch != "W") prev = c   # H and W do not separate duplicates
    }
    while (length(out) < 4) out = out "0"
    return out
}
BEGIN {
    n = split("Robert Rupert Rubin Ashcraft Tymczak Pfister Lee", names, " ")
    for (i = 1; i <= n; i++)
        printf "%-10s %s\n", names[i], soundex(names[i])
}
