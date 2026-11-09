let nums = [1, 2, 3, 4, 5, 6]
print(nums.filter { $0 % 2 == 0 }.map { $0 * $0 })
print(nums.reduce(0, +))
print(nums.sorted(by: >))
print(Dictionary(grouping: nums, by: { $0 % 3 }))
