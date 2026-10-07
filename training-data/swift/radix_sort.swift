func radixSort(_ values: [Int]) -> [Int] {
    guard var maxValue = values.max() else { return [] }
    var result = values
    var place = 1

    while maxValue > 0 {
        result = countingSortByDigit(result, place: place)
        place *= 10
        maxValue /= 10
    }
    return result
}

private func countingSortByDigit(_ values: [Int], place: Int) -> [Int] {
    var buckets = [[Int]](repeating: [], count: 10)
    for value in values {
        let digit = (value / place) % 10
        buckets[digit].append(value)
    }
    return buckets.flatMap { $0 }
}

print(radixSort([170, 45, 75, 90, 802, 24, 2, 66]))
print(radixSort([5, 3, 1, 4, 1, 5, 9, 2, 6]))
