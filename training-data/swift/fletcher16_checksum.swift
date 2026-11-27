func fletcher16(_ data: [UInt8]) -> UInt16 {
    var s1: UInt16 = 0, s2: UInt16 = 0
    for b in data {
        s1 = (s1 + UInt16(b)) % 255
        s2 = (s2 + s1) % 255
    }
    return (s2 << 8) | s1
}

print(String(fletcher16(Array("abcde".utf8)), radix: 16))
