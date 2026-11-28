function ord(c) { return index(ALL, c) + 31 }
function fletcher16(s,    i, s1, s2) {
    for (i = 1; i <= length(s); i++) {
        s1 = (s1 + ord(substr(s, i, 1))) % 255
        s2 = (s2 + s1) % 255
    }
    return s2 * 256 + s1
}
BEGIN {
    for (i = 32; i < 127; i++) ALL = ALL sprintf("%c", i)
    printf "%x\n", fletcher16("abcde")
}
