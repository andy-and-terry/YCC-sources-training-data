BEGIN {
    n = 300
    while (n >= 128) {
        printf "%02x ", (n % 128) + 128
        n = int(n / 128)
    }
    printf "%02x\n", n
}
