func shoelace(_ p: [(Double, Double)]) -> Double {
    var s = 0.0
    for i in 0..<p.count {
        let q = p[(i + 1) % p.count]
        s += p[i].0 * q.1 - q.0 * p[i].1
    }
    return abs(s) / 2
}

print(shoelace([(0, 0), (4, 0), (4, 3), (0, 3)]))
