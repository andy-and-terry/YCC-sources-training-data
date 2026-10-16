func minMaxAvg(_ xs: [Double]) -> (min: Double, max: Double, avg: Double)? {
    guard let lo = xs.min(), let hi = xs.max() else { return nil }
    return (lo, hi, xs.reduce(0, +) / Double(xs.count))
}

if let stats = minMaxAvg([3.5, 1.0, 9.25, 4.0]) {
    print("min \(stats.min), max \(stats.max), avg \(stats.avg)")
}
print(minMaxAvg([]) == nil)

var pair = (name: "x", value: 1)
pair.value += 1
let (n, v) = pair
print(n, v)
