BEGIN {
    fact[0] = 1; fact[1] = 1; fact[2] = 2; fact[3] = 6; fact[4] = 24
    fact[5] = 120; fact[6] = 720; fact[7] = 5040; fact[8] = 40320; fact[9] = 362880
    for (n = 1; n < 50000; n++) {
        sum = 0
        for (i = 1; i <= length(n); i++) sum += fact[substr(n, i, 1)]
        if (sum == n) printf "%d ", n
    }
    print ""
}
