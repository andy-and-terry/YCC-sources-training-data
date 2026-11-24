# Fibbinary numbers: no two adjacent 1 bits (checked by scanning the bits).
function is_fibbinary(n,   prev, bit) {
    prev = 0
    while (n > 0) {
        bit = n % 2
        if (bit && prev) return 0
        prev = bit
        n = int(n / 2)
    }
    return 1
}

BEGIN {
    for (n = 0; n < 50; n++)
        if (is_fibbinary(n)) printf "%d ", n
    printf "\n"
}
