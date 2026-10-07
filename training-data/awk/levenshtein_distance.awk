#!/usr/bin/awk -f
function min3(a, b, c) { return (a < b ? (a < c ? a : c) : (b < c ? b : c)) }
function lev(s, t,    m, n, i, j, cost, d) {
    m = length(s); n = length(t)
    for (i = 0; i <= m; i++) d[i, 0] = i
    for (j = 0; j <= n; j++) d[0, j] = j
    for (i = 1; i <= m; i++)
        for (j = 1; j <= n; j++) {
            cost = (substr(s, i, 1) == substr(t, j, 1)) ? 0 : 1
            d[i, j] = min3(d[i - 1, j] + 1, d[i, j - 1] + 1, d[i - 1, j - 1] + cost)
        }
    return d[m, n]
}
BEGIN {
    print lev("kitten", "sitting")
    print lev("flaw", "lawn")
    print lev("same", "same")
}
