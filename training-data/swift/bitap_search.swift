func bitap(_ text: String, _ pat: String) -> Int {
    let p = Array(pat.utf8), t = Array(text.utf8)
    var masks = [UInt64](repeating: 0, count: 256)
    for (i, b) in p.enumerated() { masks[Int(b)] |= 1 << UInt64(i) }
    let goal: UInt64 = 1 << UInt64(p.count - 1)
    var state: UInt64 = 0
    for (i, b) in t.enumerated() {
        state = ((state << 1) | 1) & masks[Int(b)]
        if state & goal != 0 { return i - p.count + 1 }
    }
    return -1
}
print(bitap("the quick brown fox", "brown"))
