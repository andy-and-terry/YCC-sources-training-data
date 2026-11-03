function digit_square_sum(n,    i, d, sum) {
    n = (n < 0) ? -n : n
    for (i = 1; i <= length(n); i++) {
        d = substr(n, i, 1)
        sum += d * d
    }
    return sum
}

BEGIN {
    print digit_square_sum(123)
    print digit_square_sum(-99)
}
