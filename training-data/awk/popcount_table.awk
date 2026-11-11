# Population count (number of set bits) for 0..15
function bits(n,   c) {
    while (n > 0) { c += n % 2; n = int(n / 2) }
    return c + 0
}

BEGIN {
    for (n = 0; n < 16; n++) printf "%d ", bits(n)
    printf "\n"
}
