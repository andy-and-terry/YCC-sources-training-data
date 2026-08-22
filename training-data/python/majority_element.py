from typing import List


def majority_element(nums: List[int]) -> int:
    count = 0
    candidate = None
    for num in nums:
        if count == 0:
            candidate = num
        count += 1 if num == candidate else -1
    return candidate


if __name__ == "__main__":
    print(majority_element([2, 2, 1, 1, 1, 2, 2]))
