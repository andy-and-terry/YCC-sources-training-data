func crc8(_ data: [UInt8]) -> UInt8 {
    var crc: UInt8 = 0
    for b in data {
        crc ^= b
        for _ in 0..<8 {
            crc = (crc & 0x80) != 0 ? (crc << 1) ^ 0x07 : crc << 1
        }
    }
    return crc
}

print(String(crc8(Array("123456789".utf8)), radix: 16))
