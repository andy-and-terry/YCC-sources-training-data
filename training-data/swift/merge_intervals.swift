func mergeIntervals(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else { return [] }
    let sorted = intervals.sorted { $0[0] < $1[0] }
    var result: [[Int]] = [sorted[0]]

    for interval in sorted.dropFirst() {
        if interval[0] <= result[result.count - 1][1] {
            result[result.count - 1][1] = max(result[result.count - 1][1], interval[1])
        } else {
            result.append(interval)
        }
    }
    return result
}

print(mergeIntervals([[1, 3], [2, 6], [8, 10], [15, 18]]))
