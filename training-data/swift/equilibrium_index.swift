func equilibriumIndex(_ nums: [Int]) -> Int {
    let total = nums.reduce(0, +)
    var left = 0
    for (i, v) in nums.enumerated() {
        if left == total - left - v { return i }
        left += v
    }
    return -1
}

print(equilibriumIndex([1, 7, 3, 6, 5, 6])) // 3
