function is_automorphic(n,    sq) {
    sq = n * n ""
    return substr(sq, length(sq) - length(n) + 1) == n ""
}

BEGIN {
    for (n = 0; n < 1000; n++)
        if (is_automorphic(n)) printf "%d ", n
    print "" # 0 1 5 6 25 76 376 625
}
