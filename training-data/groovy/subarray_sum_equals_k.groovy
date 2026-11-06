// Count contiguous subarrays whose sum equals k (prefix sums + Map).
int countSubarrays(List<Integer> nums, int k) {
    def seen = [0: 1]
    int total = 0, count = 0
    nums.each { x ->
        total += x
        count += seen.getOrDefault(total - k, 0)
        seen[total] = seen.getOrDefault(total, 0) + 1
    }
    count
}

println countSubarrays([1, 1, 1], 2)
