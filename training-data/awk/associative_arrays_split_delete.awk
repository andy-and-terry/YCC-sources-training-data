#!/usr/bin/awk -f
BEGIN {
    n = split("apple,banana,cherry,date", fruit, ",")
    for (i = 1; i <= n; i++) idx[fruit[i]] = i
    print n, idx["cherry"], ("fig" in idx) ? "has fig" : "no fig"
    delete idx["banana"]
    cnt = 0
    for (k in idx) cnt++
    print cnt
    sizes["s"] = 1; sizes["m"] = 2; sizes["l"] = 3
    m = 0; for (k in sizes) if (sizes[k] > m) { m = sizes[k]; best = k }
    print best, m
    delete sizes
    print length(sizes)
    grid[1, 2] = "x"; grid[3, 4] = "y"
    for (key in grid) { split(key, p, SUBSEP); out[p[1]] = p[2] }
    print out[1], out[3], ((1, 2) in grid)
}
