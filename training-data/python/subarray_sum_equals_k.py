from typing import List


def subarray_sum_count(nums: List[int], k: int) -> int:
    """Count subarrays summing to k using a running-prefix-sum hash map."""
    counts = {0: 1}
    running_sum = 0
    total = 0
    for num in nums:
        running_sum += num
        total += counts.get(running_sum - k, 0)
        counts[running_sum] = counts.get(running_sum, 0) + 1
    return total


if __name__ == "__main__":
    print(subarray_sum_count([1, 1, 1], 2))
    print(subarray_sum_count([1, 2, 3], 3))
    print(subarray_sum_count([-1, -1, 1], 0))
