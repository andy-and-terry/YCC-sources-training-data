def varint(int n) {
    def out = []
    while (n >= 0x80) {
        out << ((n & 0x7F) | 0x80)
        n >>= 7
    }
    out << n
    out
}

println varint(300).collect { Integer.toHexString(it) }
