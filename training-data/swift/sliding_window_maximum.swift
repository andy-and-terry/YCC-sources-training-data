func slidingWindowMaximum(_ nums: [Int], _ k: Int) -> [Int] {
    guard k > 0, k <= nums.count else { return [] }
    var deque: [Int] = []
    var result: [Int] = []

    for i in 0..<nums.count {
        while let first = deque.first, first <= i - k {
            deque.removeFirst()
        }
        while let last = deque.last, nums[last] < nums[i] {
            deque.removeLast()
        }
        deque.append(i)
        if i >= k - 1 {
            result.append(nums[deque.first!])
        }
    }
    return result
}

let nums = [1, 3, -1, -3, 5, 3, 6, 7]
print(slidingWindowMaximum(nums, 3))
