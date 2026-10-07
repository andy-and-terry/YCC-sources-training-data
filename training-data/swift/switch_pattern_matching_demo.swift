func classify(_ value: (Int, Int)) -> String {
    switch value {
    case (0, 0):
        return "origin"
    case (let x, 0):
        return "on x-axis at \(x)"
    case (0, let y):
        return "on y-axis at \(y)"
    case let (x, y) where x == y:
        return "diagonal \(x)"
    case (1...5, 1...5):
        return "small quadrant point"
    default:
        return "elsewhere"
    }
}

for p in [(0, 0), (4, 0), (0, -2), (3, 3), (2, 5), (9, 1)] {
    print(p, "->", classify(p))
}

let age = 34
switch age {
case ..<13: print("child")
case 13..<20: print("teen")
default: print("adult")
}
