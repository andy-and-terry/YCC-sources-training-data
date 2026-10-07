typealias Point = (x: Double, y: Double)
typealias Handler = (String) -> Void
typealias Stats = (min: Int, max: Int, mean: Double)

func stats(of values: [Int]) -> Stats? {
    guard let lo = values.min(), let hi = values.max() else { return nil }
    let mean = Double(values.reduce(0, +)) / Double(values.count)
    return (lo, hi, mean)
}

func distance(_ a: Point, _ b: Point) -> Double {
    let dx = a.x - b.x
    let dy = a.y - b.y
    return (dx * dx + dy * dy).squareRoot()
}

let log: Handler = { print("log:", $0) }
if let s = stats(of: [4, 8, 15, 16, 23, 42]) {
    log("min \(s.min) max \(s.max) mean \(s.mean)")
}
print(distance((0, 0), (3, 4)))

var (q, r) = (17 / 5, 17 % 5)
(q, r) = (r, q)
print(q, r)
