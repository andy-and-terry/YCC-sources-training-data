func lucasLehmer(_ p: Int) -> Bool {
    if p == 2 { return true }
    let m = (1 << p) - 1
    var s = 4
    for _ in 0..<(p - 2) {
        s = (s * s - 2) % m
    }
    return s == 0
}

let exponents = [2, 3, 5, 7, 11, 13, 17, 19].filter(lucasLehmer)
print(exponents.map { String($0) }.joined(separator: " "))
