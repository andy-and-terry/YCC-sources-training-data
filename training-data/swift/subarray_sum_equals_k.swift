// Count contiguous subarrays whose sum equals k (prefix sums + Dictionary).
func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var seen: [Int: Int] = [0: 1]
    var total = 0, count = 0
    for x in nums {
        total += x
        count += seen[total - k, default: 0]
        seen[total, default: 0] += 1
    }
    return count
}

print(countSubarrays([1, 1, 1], 2))
