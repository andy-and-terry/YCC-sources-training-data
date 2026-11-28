BEGIN {
    n = 8
    for (r = 0; r < n; r++) {
        line = sprintf("%*s", n - r - 1, "")
        for (c = 0; c <= r; c++)
            line = line ((and(r, c) == c) ? "* " : "  ")
        print line
    }
}
