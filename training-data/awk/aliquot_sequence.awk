# Aliquot sequence: replace n by the sum of its proper divisors.
function aliquot_sum(n,   s, d) {
    s = 0
    for (d = 1; d <= n / 2; d++)
        if (n % d == 0) s += d
    return s
}

BEGIN {
    n = 12
    printf "%d", n
    for (i = 0; i < 20 && n > 1; i++) {
        n = aliquot_sum(n)
        printf " %d", n
    }
    printf "\n"
}
