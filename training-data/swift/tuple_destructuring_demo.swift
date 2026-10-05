func minMax(_ values: [Int]) -> (min: Int, max: Int)? {
    guard var lo = values.first else { return nil }
    var hi = lo
    for v in values.dropFirst() {
        lo = Swift.min(lo, v)
        hi = Swift.max(hi, v)
    }
    return (lo, hi)
}

if let (lo, hi) = minMax([4, 9, -2, 7]) {
    print("min \(lo), max \(hi)")
}

let result = minMax([3, 1, 2])
print(result?.min ?? 0, result?.max ?? 0)

var a = 1, b = 2
(a, b) = (b, a)
print(a, b)

let people = [("Ada", 36), ("Linus", 54)]
for (name, age) in people {
    print("\(name) is \(age)")
}

let (quotient, remainder) = (17 / 5, 17 % 5)
print(quotient, remainder)
