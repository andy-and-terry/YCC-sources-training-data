func pythagoreanTriples(upTo limit: Int) -> [(Int, Int, Int)] {
    var result: [(Int, Int, Int)] = []
    for a in 1..<limit {
        for b in a..<limit {
            let c2 = a * a + b * b
            let c = Int(Double(c2).squareRoot())
            if c <= limit && c * c == c2 {
                result.append((a, b, c))
            }
        }
    }
    return result
}

for (a, b, c) in pythagoreanTriples(upTo: 20) {
    print("\(a)^2 + \(b)^2 = \(c)^2")
}
