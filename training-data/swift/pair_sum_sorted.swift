func pairWithSum(_ nums: [Int], _ target: Int) -> (Int, Int)? {
    var i = 0, j = nums.count - 1
    while i < j {
        let s = nums[i] + nums[j]
        if s == target { return (i, j) }
        if s < target { i += 1 } else { j -= 1 }
    }
    return nil
}

print(pairWithSum([1, 3, 4, 6, 8, 11], 10) as Any)
print(pairWithSum([1, 2, 3], 100) as Any)
