func majorityElement(_ nums: [Int]) -> Int? {
    var candidate: Int?
    var count = 0

    for num in nums {
        if count == 0 {
            candidate = num
        }
        count += (num == candidate) ? 1 : -1
    }

    guard let result = candidate, nums.filter({ $0 == result }).count > nums.count / 2 else {
        return nil
    }
    return result
}

print(majorityElement([2, 2, 1, 1, 1, 2, 2]) ?? -1)
print(majorityElement([3, 3, 4, 2, 4, 4, 2, 4, 4]) ?? -1)
print(majorityElement([1, 2, 3]) ?? -1)
