func modInverse(_ a: Int, _ m: Int) -> Int {
    (1..<m).first { a * $0 % m == 1 } ?? 0
}

func affine(_ s: String, _ a: Int, _ b: Int, decrypt: Bool = false) -> String {
    let inv = modInverse(a, 26)
    return String(s.unicodeScalars.map { u -> Character in
        guard u.value >= 65 && u.value <= 90 else { return Character(u) }
        let x = Int(u.value) - 65
        let y = decrypt ? (((inv * (x - b)) % 26) + 26) % 26 : (a * x + b) % 26
        return Character(UnicodeScalar(UInt8(y + 65)))
    })
}

let c = affine("AFFINE", 5, 8)
print(c, affine(c, 5, 8, decrypt: true))
