function max(a, b) { return a > b ? a : b }
function repeat(s, n,   out, i) {
    for (i = 0; i < n; i++) out = out s
    return out
}
BEGIN {
    print max(3, 9)
    print repeat("ab", 3)
}
