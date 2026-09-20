func countingSort(_ arr: [Int]) -> [Int] {
    guard let maxValue = arr.max() else { return arr }
    var counts = [Int](repeating: 0, count: maxValue + 1)
    for value in arr {
        counts[value] += 1
    }
    var result: [Int] = []
    result.reserveCapacity(arr.count)
    for (value, count) in counts.enumerated() {
        result.append(contentsOf: repeatElement(value, count: count))
    }
    return result
}

print(countingSort([4, 2, 2, 8, 3, 3, 1]))
print(countingSort([]))
