func histogram(_ s: String, width: Int = 30) -> String {
    let counts = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
    let peak = counts.values.max() ?? 1
    return counts.keys.sorted().map { k in
        let n = counts[k]!
        return "\(k) | \(String(repeating: "#", count: max(1, n * width / peak))) \(n)"
    }.joined(separator: "\n")
}

print(histogram("theraininspainfallsmainlyontheplain"))
