function to_base(n, base,    digits, out) {
    digits = "0123456789abcdefghijklmnopqrstuvwxyz"
    if (n == 0) return "0"
    while (n > 0) {
        out = substr(digits, n % base + 1, 1) out
        n = int(n / base)
    }
    return out
}

BEGIN {
    split("2 8 16 36", bases, " ")
    for (i = 1; i <= 4; i++)
        printf "255 in base %d = %s\n", bases[i], to_base(255, bases[i])
}
