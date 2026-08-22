func twoSum(_ nums: [Int], target: Int) -> (Int, Int)? {
    var seen: [Int: Int] = [:]
    for (i, n) in nums.enumerated() {
        if let j = seen[target - n] {
            return (j, i)
        }
        seen[n] = i
    }
    return nil
}

if let result = twoSum([2, 7, 11, 15], target: 9) {
    print(result)
}
