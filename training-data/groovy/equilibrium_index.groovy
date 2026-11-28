def equilibriumIndex(List<Integer> nums) {
    int total = nums.sum()
    int left = 0
    for (int i = 0; i < nums.size(); i++) {
        if (left == total - left - nums[i]) return i
        left += nums[i]
    }
    -1
}

println equilibriumIndex([1, 7, 3, 6, 5, 6]) // 3
