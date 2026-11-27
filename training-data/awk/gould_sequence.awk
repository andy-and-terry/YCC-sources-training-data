function popcount(n,    c) {
    while (n > 0) { c += n % 2; n = int(n / 2) }
    return c
}
BEGIN {
    for (n = 0; n < 16; n++) printf "%d ", 2 ^ popcount(n)
    print ""
}
