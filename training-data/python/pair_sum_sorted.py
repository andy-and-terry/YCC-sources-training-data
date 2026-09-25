def pair_with_sum(nums, target):
    i, j = 0, len(nums) - 1
    while i < j:
        s = nums[i] + nums[j]
        if s == target:
            return i, j
        if s < target:
            i += 1
        else:
            j -= 1
    return None


if __name__ == "__main__":
    print(pair_with_sum([1, 3, 4, 6, 8, 11], 10))
    print(pair_with_sum([1, 2, 3], 100))
