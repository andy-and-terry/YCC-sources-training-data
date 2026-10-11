func describe(_ n: Int) -> String {
    var parts: [String] = []
    switch n {
    case 0:
        parts.append("zero")
    case 1..<10:
        parts.append("single digit")
        fallthrough
    case 10..<100:
        parts.append("small")
    default:
        parts.append("large")
    }
    return parts.joined(separator: ", ")
}

for n in [0, 5, 50, 500] {
    print("\(n): \(describe(n))")
}
