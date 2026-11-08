BEGIN {
    split("10 12 15 15 20", xs, " ")
    d[1] = xs[1]
    for (i = 2; i <= 5; i++) d[i] = xs[i] - xs[i - 1]
    for (i = 1; i <= 5; i++) printf "%d ", d[i]
    print ""
    acc = 0
    for (i = 1; i <= 5; i++) { acc += d[i]; printf "%d ", acc }
    print ""
}
