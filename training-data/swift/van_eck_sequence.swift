func vanEck(_ count: Int) -> [Int] {
    var seq = [0]
    var lastSeen: [Int: Int] = [:]
    for n in 0..<(count - 1) {
        let current = seq[n]
        let next = lastSeen[current].map { n - $0 } ?? 0
        lastSeen[current] = n
        seq.append(next)
    }
    return seq
}

print(vanEck(20).map(String.init).joined(separator: " "))
