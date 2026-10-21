# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
function is_hamming(n,    i, p) {
    split("2 3 5", f, " ")
    for (i = 1; i <= 3; i++) {
        p = f[i]
        while (n % p == 0) n = n / p
    }
    return n == 1
}

BEGIN {
    count = 0
    for (n = 1; count < 20; n++) {
        if (is_hamming(n)) {
            printf "%d%s", n, (count < 19 ? " " : "\n")
            count++
        }
    }
}
