func bucketSort(_ values: [Int], bucketCount: Int) -> [Int] {
    guard let maxValue = values.max(), let minValue = values.min(), maxValue > minValue else {
        return values
    }
    let range = maxValue - minValue + 1
    var buckets = Array(repeating: [Int](), count: bucketCount)

    for value in values {
        let index = (value - minValue) * bucketCount / range
        let clamped = min(index, bucketCount - 1)
        buckets[clamped].append(value)
    }

    var result: [Int] = []
    for bucket in buckets {
        result.append(contentsOf: bucket.sorted())
    }
    return result
}

let unsorted = [29, 25, 3, 49, 9, 37, 21, 43]
print(bucketSort(unsorted, bucketCount: 5))
