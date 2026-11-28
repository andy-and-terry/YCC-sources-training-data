int popcount(long n) {
    int c = 0
    while (n != 0) {
        n &= n - 1
        c++
    }
    c
}

println "${popcount(0xB7)} ${Long.bitCount(0xB7)}"
