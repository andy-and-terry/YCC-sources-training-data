func minMax(_ values: [Int]) -> (min: Int, max: Int)? {
    guard var lo = values.first else { return nil }
    var hi = lo
    for v in values {
        lo = Swift.min(lo, v)
        hi = Swift.max(hi, v)
    }
    return (lo, hi)
}

if let (lo, hi) = minMax([4, 9, -2, 7]) {
    print(lo, hi)
}

let result = minMax([3, 1, 2])
print(result!.min, result!.max)

var a = 1, b = 2
(a, b) = (b, a)
print(a, b)

let (quotient, remainder) = (17 / 5, 17 % 5)
print(quotient, remainder)

let (_, second, _) = ("x", "y", "z")
print(second)
