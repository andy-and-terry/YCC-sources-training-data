// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
func isKeith(_ n: Int) -> Bool {
    var seq = String(n).compactMap { $0.wholeNumberValue }
    let k = seq.count
    while seq.last! < n {
        seq.append(seq.suffix(k).reduce(0, +))
    }
    return seq.last! == n
}

print((10..<1200).filter(isKeith).map(String.init).joined(separator: " "))
