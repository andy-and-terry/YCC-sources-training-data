func varint(_ value: UInt64) -> [UInt8] {
    var n = value
    var out: [UInt8] = []
    while n >= 0x80 {
        out.append(UInt8(n & 0x7F) | 0x80)
        n >>= 7
    }
    out.append(UInt8(n))
    return out
}

print(varint(300).map { String($0, radix: 16) })
