from typing import List


def rotate(nums: List[int], k: int) -> List[int]:
    n = len(nums)
    k %= n
    return nums[-k:] + nums[:-k] if k else nums[:]


if __name__ == "__main__":
    print(rotate([1, 2, 3, 4, 5, 6, 7], 3))
