func hasSubsetSum(_ nums: [Int], target: Int) -> Bool {
    var dp = [Bool](repeating: false, count: target + 1)
    dp[0] = true

    for num in nums {
        var t = target
        while t >= num {
            if dp[t - num] {
                dp[t] = true
            }
            t -= 1
        }
    }
    return dp[target]
}

print(hasSubsetSum([3, 34, 4, 12, 5, 2], target: 9))  // true
print(hasSubsetSum([1, 2, 5], target: 4))             // false
