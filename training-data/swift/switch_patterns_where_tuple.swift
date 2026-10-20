func classify(_ p: (Int, Int)) -> String {
    switch p {
    case (0, 0): return "origin"
    case (let x, 0): return "x-axis \(x)"
    case (0, let y): return "y-axis \(y)"
    case let (x, y) where x == y: return "diagonal"
    case (1...5, 1...5): return "near"
    default: return "far"
    }
}
for p in [(0, 0), (3, 0), (0, 4), (2, 2), (1, 3), (9, 1)] { print(classify(p)) }
let v: Any = 3.5
switch v {
case let i as Int: print("int \(i)")
case let d as Double where d > 3: print("big double \(d)")
default: print("other")
}
outer: for i in 1...3 { for j in 1...3 { if i * j == 4 { print("found", i, j); break outer } } }
