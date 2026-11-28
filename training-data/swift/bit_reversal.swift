func reverseBits(_ value: UInt8) -> UInt8 {
    var v = value
    var result: UInt8 = 0
    for _ in 0..<8 {
        result = (result << 1) | (v & 1)
        v >>= 1
    }
    return result
}

for v: UInt8 in [1, 6, 13, 128] {
    print(v, reverseBits(v)) // 128, 96, 176, 1
}
