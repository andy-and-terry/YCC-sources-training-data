function is_prime(n,    i) {
    if (n < 2) return 0
    for (i = 2; i * i <= n; i++) if (n % i == 0) return 0
    return 1
}

function rev(n,    r, i) {
    for (i = length(n); i >= 1; i--) r = r substr(n, i, 1)
    return r + 0
}

BEGIN {
    for (p = 2; p < 200; p++) {
        r = rev(p)
        if (r != p && is_prime(p) && is_prime(r)) printf "%d ", p
    }
    print "" # 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
}
