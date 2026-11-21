# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function is_bouncy(n,    i, inc, dec, a, b) {
    inc = 1; dec = 1
    for (i = 2; i <= length(n); i++) {
        a = substr(n, i - 1, 1) + 0
        b = substr(n, i, 1) + 0
        if (a > b) inc = 0
        if (a < b) dec = 0
    }
    return !inc && !dec
}
BEGIN {
    for (n = 1; n < 1000; n++) if (is_bouncy(n)) count++
    print count
}
