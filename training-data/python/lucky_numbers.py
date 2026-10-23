def lucky(limit: int) -> list[int]:
    nums = list(range(1, limit, 2))
    i = 1
    while i < len(nums) and nums[i] <= len(nums):
        step = nums[i]
        del nums[step - 1::step]
        i += 1
    return nums


if __name__ == "__main__":
    print(" ".join(map(str, lucky(100))))
