#!/usr/bin/awk -f
# First-fit bin packing
function pack(items, n, cap,   i, b, nb, used) {
    nb = 0
    for (i = 1; i <= n; i++) {
        for (b = 1; b <= nb; b++)
            if (used[b] + items[i] <= cap) break
        if (b > nb) { nb++; used[b] = 0 }
        used[b] += items[i]
    }
    return nb
}
BEGIN {
    n = split("4 8 1 4 2 1 7 3", items, " ")
    print "bins:", pack(items, n, 10)
}
