# Print the first 15 Pell numbers: P(n) = 2*P(n-1) + P(n-2)
BEGIN {
    a = 0; b = 1
    for (i = 0; i < 15; i++) {
        printf "P(%d) = %d\n", i, a
        t = 2 * b + a
        a = b
        b = t
    }
}
