function reverse_bits(v,    r, i) {
    for (i = 0; i < 8; i++) {
        r = r * 2 + v % 2
        v = int(v / 2)
    }
    return r
}

BEGIN {
    n = split("1 6 13 128", vals, " ")
    for (i = 1; i <= n; i++) print vals[i], reverse_bits(vals[i]) # 128 96 176 1
}
