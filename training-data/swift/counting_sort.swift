func countingSort(_ values: [Int]) -> [Int] {
    guard let maxValue = values.max(), let minValue = values.min() else { return [] }

    var counts = [Int](repeating: 0, count: maxValue - minValue + 1)
    for value in values {
        counts[value - minValue] += 1
    }

    var result: [Int] = []
    result.reserveCapacity(values.count)
    for (offset, count) in counts.enumerated() {
        result.append(contentsOf: repeatElement(offset + minValue, count: count))
    }
    return result
}

print(countingSort([4, 2, 2, 8, 3, 3, 1]))
print(countingSort([-2, -5, 0, 3, -1]))
