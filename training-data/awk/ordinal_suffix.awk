function ordinal(n,    r100, r10, s) {
    r100 = n % 100; r10 = n % 10
    if (r100 >= 11 && r100 <= 13) s = "th"
    else if (r10 == 1) s = "st"
    else if (r10 == 2) s = "nd"
    else if (r10 == 3) s = "rd"
    else s = "th"
    return n s
}

BEGIN {
    n = split("1 2 3 4 11 12 13 21 101 111", xs, " ")
    for (i = 1; i <= n; i++) printf "%s ", ordinal(xs[i])
    print ""
}
