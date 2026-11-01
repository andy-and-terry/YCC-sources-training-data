# Evil numbers have an even number of 1 bits.
function popcount(n,   c) {
    for (c = 0; n > 0; n = int(n / 2)) c += n % 2
    return c
}
BEGIN {
    for (n = 0; n <= 20; n++)
        if (popcount(n) % 2 == 0) printf "%d ", n
    print ""
}
