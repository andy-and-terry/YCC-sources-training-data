func nextGreaterElements(_ nums: [Int]) -> [Int] {
    var result = [Int](repeating: -1, count: nums.count)
    var stack: [Int] = []

    for i in 0..<nums.count {
        while let top = stack.last, nums[top] < nums[i] {
            result[top] = nums[i]
            stack.removeLast()
        }
        stack.append(i)
    }
    return result
}

let nums = [2, 1, 2, 4, 3]
print(nextGreaterElements(nums))
