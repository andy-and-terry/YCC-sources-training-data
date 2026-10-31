func persistence(_ value: Int) -> Int {
    var n = value, steps = 0
    while n >= 10 {
        n = String(n).compactMap { $0.wholeNumberValue }.reduce(1, *)
        steps += 1
    }
    return steps
}

for n in [39, 77, 999, 10] {
    print(n, persistence(n))
}
