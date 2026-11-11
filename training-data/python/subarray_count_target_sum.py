"""Count contiguous subarrays whose sum equals k (prefix-sum hash map)."""
from collections import defaultdict


def count_subarrays(nums, k):
    seen = defaultdict(int)
    seen[0] = 1
    total = count = 0
    for x in nums:
        total += x
        count += seen[total - k]
        seen[total] += 1
    return count


print(count_subarrays([1, 1, 1], 2))
