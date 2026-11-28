function is_happy(n,    seen, s, i) {
    split("", seen)
    while (n != 1 && !(n in seen)) {
        seen[n] = 1
        s = 0
        for (i = 1; i <= length(n); i++) s += substr(n, i, 1) ^ 2
        n = s
    }
    return n == 1
}

BEGIN {
    for (n = 1; c < 8; n++)
        if (is_happy(n)) { printf "%d ", n; c++ }
    print "" # 1 7 10 13 19 23 28 31
}
