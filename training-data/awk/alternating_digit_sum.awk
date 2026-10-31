function alternating_digit_sum(n,    total, sign) {
    sign = 1
    while (n > 0) {
        total += sign * (n % 10)
        sign = -sign
        n = int(n / 10)
    }
    return total
}
BEGIN {
    split("1234 99999 1000", values, " ")
    for (i = 1; i <= 3; i++) print values[i], alternating_digit_sum(values[i])
}
