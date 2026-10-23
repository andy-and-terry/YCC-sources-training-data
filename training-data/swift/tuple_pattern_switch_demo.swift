func describe(point: (Int, Int)) -> String {
    switch point {
    case (0, 0):
        return "origin"
    case (let x, 0):
        return "on x-axis at \(x)"
    case (0, let y):
        return "on y-axis at \(y)"
    case (let x, let y) where x == y:
        return "on diagonal at \(x)"
    case (-2...2, -2...2):
        return "near the origin"
    default:
        return "somewhere else"
    }
}

let points = [(0, 0), (5, 0), (0, -3), (4, 4), (1, 2), (9, 1)]
for p in points {
    print("\(p): \(describe(point: p))")
}
