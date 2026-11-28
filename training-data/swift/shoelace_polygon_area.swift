func area(_ p: [(x: Double, y: Double)]) -> Double {
    var s = 0.0
    for i in p.indices {
        let a = p[i], b = p[(i + 1) % p.count]
        s += a.x * b.y - b.x * a.y
    }
    return abs(s) / 2
}

print(area([(0, 0), (4, 0), (4, 3), (0, 3)]))
