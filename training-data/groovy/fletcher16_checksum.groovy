def fletcher16(byte[] data) {
    int s1 = 0, s2 = 0
    data.each { b ->
        s1 = (s1 + (b & 0xff)) % 255
        s2 = (s2 + s1) % 255
    }
    (s2 << 8) | s1
}

println Integer.toHexString(fletcher16('abcde'.bytes))
