# Count contiguous subarrays whose sum equals k (prefix sums + assoc array).
function count_subarrays(nums, n, k,    seen, total, count, i) {
    seen[0] = 1
    for (i = 1; i <= n; i++) {
        total += nums[i]
        count += seen[total - k]
        seen[total]++
    }
    return count + 0
}

BEGIN {
    n = split("1 1 1", nums, " ")
    print count_subarrays(nums, n, 2)
}
