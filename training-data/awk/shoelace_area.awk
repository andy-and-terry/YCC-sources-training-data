{ x[NR] = $1; y[NR] = $2 }
END {
    for (i = 1; i <= NR; i++) {
        j = i % NR + 1
        s += x[i] * y[j] - x[j] * y[i]
    }
    print (s < 0 ? -s : s) / 2
}
