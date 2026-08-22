func maxSubArray(_ nums: [Int]) -> Int {
    var maxSoFar = nums[0]
    var maxEndingHere = nums[0]
    for i in 1..<nums.count {
        maxEndingHere = max(nums[i], maxEndingHere + nums[i])
        maxSoFar = max(maxSoFar, maxEndingHere)
    }
    return maxSoFar
}

print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
