// Read the binary digits of i as base-4 digits.
func moserDeBruijn(_ i: Int) -> Int {
    Int(String(i, radix: 2), radix: 4)!
}

print((0..<10).map { String(moserDeBruijn($0)) }.joined(separator: " ")) // 0 1 4 5 16 17 20 21 64 65
