enum TriangleKind { case equilateral, isosceles, scalene }

func classify(_ a: Double, _ b: Double, _ c: Double) -> TriangleKind? {
    let s = [a, b, c].sorted()
    guard s[0] > 0, s[0] + s[1] > s[2] else { return nil }
    switch Set([a, b, c]).count {
    case 1: return .equilateral
    case 2: return .isosceles
    default: return .scalene
    }
}

for t in [(3.0, 3.0, 3.0), (3, 4, 4), (3, 4, 5), (1, 1, 3)] {
    print(t, classify(t.0, t.1, t.2).map { "\($0)" } ?? "invalid")
}
