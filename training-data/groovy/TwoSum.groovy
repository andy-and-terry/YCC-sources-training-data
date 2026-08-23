def twoSum(nums, target) {
    def seen = [:]
    for (int i = 0; i < nums.size(); i++) {
        int complement = target - nums[i]
        if (seen.containsKey(complement)) {
            return [seen[complement], i]
        }
        seen[nums[i]] = i
    }
    return []
}

println twoSum([2, 7, 11, 15], 9)
