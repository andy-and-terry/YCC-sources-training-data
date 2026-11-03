BEGIN {
    n = split("1 2 2 3 3 4", items, " ")
    for (i = 1; i <= n; i++) {
        counts[items[i]]++
        if (counts[items[i]] > top) top = counts[items[i]]
    }
    for (k in counts) if (counts[k] == top) printf "%s ", k
    print ""
}
