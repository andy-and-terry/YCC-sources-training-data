# Thue-Morse: t(n) is the parity of the number of 1 bits in n
function parity(n,    p) {
    p = 0
    while (n > 0) {
        p = (p + n % 2) % 2
        n = int(n / 2)
    }
    return p
}

BEGIN {
    for (n = 0; n < 32; n++) out = out parity(n)
    print out
}
