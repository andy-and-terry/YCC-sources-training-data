func hexDump(_ bytes: [UInt8], width: Int = 8) {
    for start in stride(from: 0, to: bytes.count, by: width) {
        let chunk = bytes[start..<min(start + width, bytes.count)]
        let hex = chunk.map { String($0, radix: 16).count == 1 ? "0" + String($0, radix: 16) : String($0, radix: 16) }
        let padding = String(repeating: "   ", count: width - chunk.count)
        let text = chunk.map { $0 >= 32 && $0 < 127 ? Character(UnicodeScalar($0)) : "." }
        print(hex.joined(separator: " ") + " " + padding + "|" + String(text) + "|")
    }
}

hexDump(Array("Hello, Swift hex dump!\n\t".utf8))
