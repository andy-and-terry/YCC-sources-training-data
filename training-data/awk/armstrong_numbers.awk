function is_armstrong(n,    len, sum, i) {
    len = length(n)
    for (i = 1; i <= len; i++) sum += substr(n, i, 1) ^ len
    return sum == n
}

BEGIN {
    for (n = 1; n < 1000; n++)
        if (is_armstrong(n)) printf "%d ", n
    print "" # 1..9 153 370 371 407
}
