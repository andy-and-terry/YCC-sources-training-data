func isSelfDescribing(_ n: Int) -> Bool {
    let digits = String(n).compactMap { $0.wholeNumberValue }
    return digits.indices.allSatisfy { i in digits.filter { $0 == i }.count == digits[i] }
}

for n in [1210, 2020, 21200, 1211] {
    print(n, isSelfDescribing(n))
}
