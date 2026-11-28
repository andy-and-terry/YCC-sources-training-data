func order(_ n: Int, _ k: Int) -> [Int] {
    let cycle = 2 * (k - 1)
    func rail(_ i: Int) -> Int { let r = i % cycle; return r < k ? r : cycle - r }
    return (0..<n).sorted { (rail($0), $0) < (rail($1), $1) }
}

func encrypt(_ t: String, _ k: Int) -> String {
    let chars = Array(t)
    return String(order(chars.count, k).map { chars[$0] })
}

func decrypt(_ c: String, _ k: Int) -> String {
    let chars = Array(c)
    var out = chars
    for (pos, i) in order(chars.count, k).enumerated() { out[i] = chars[pos] }
    return String(out)
}

let c = encrypt("WEAREDISCOVERED", 3)
print(c, decrypt(c, 3))
