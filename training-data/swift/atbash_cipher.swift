enum Atbash {
    static func decode(_ text: String) -> String {
        String(text.lowercased().compactMap { c -> Character? in
            guard let a = c.asciiValue else { return nil }
            switch a {
            case 97...122: return Character(UnicodeScalar(219 - a))
            case 48...57: return c
            default: return nil
            }
        })
    }

    static func encode(_ text: String) -> String {
        let chars = Array(decode(text))
        return stride(from: 0, to: chars.count, by: 5)
            .map { String(chars[$0..<min($0 + 5, chars.count)]) }
            .joined(separator: " ")
    }
}

let e = Atbash.encode("The quick brown fox")
print(e, "->", Atbash.decode(e))
