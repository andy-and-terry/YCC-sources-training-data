func lengthOfLIS(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    var tails: [Int] = []

    for num in nums {
        var lo = 0
        var hi = tails.count
        while lo < hi {
            let mid = (lo + hi) / 2
            if tails[mid] < num {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        if lo == tails.count {
            tails.append(num)
        } else {
            tails[lo] = num
        }
    }
    return tails.count
}

print(lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18])) // 4
print(lengthOfLIS([0, 1, 0, 3, 2, 3]))           // 4
