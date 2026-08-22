import heapq
from typing import List


def kth_largest(nums: List[int], k: int) -> int:
    heap = nums[:k]
    heapq.heapify(heap)
    for num in nums[k:]:
        if num > heap[0]:
            heapq.heapreplace(heap, num)
    return heap[0]


if __name__ == "__main__":
    print(kth_largest([3, 2, 1, 5, 6, 4], 2))
