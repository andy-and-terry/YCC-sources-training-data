func lucky(_ limit: Int) -> [Int] {
    var nums = Array(stride(from: 1, through: limit, by: 2))
    var i = 1
    while i < nums.count && nums[i] <= nums.count {
        let step = nums[i]
        nums = nums.enumerated()
            .filter { ($0.offset + 1) % step != 0 }
            .map { $0.element }
        i += 1
    }
    return nums
}

print(lucky(50).map(String.init).joined(separator: " "))
