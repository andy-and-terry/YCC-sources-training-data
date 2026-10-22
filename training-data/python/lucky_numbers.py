def lucky(limit: int) -> list[int]:
    nums = list(range(1, limit + 1, 2))
    i = 1
    while i < len(nums) and nums[i] <= len(nums):
        step = nums[i]
        nums = [v for idx, v in enumerate(nums, 1) if idx % step]
        i += 1
    return nums


if __name__ == "__main__":
    print(" ".join(map(str, lucky(50))))
