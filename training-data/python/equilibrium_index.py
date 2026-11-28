def equilibrium_index(nums):
    total, left = sum(nums), 0
    for i, v in enumerate(nums):
        if left == total - left - v:
            return i
        left += v
    return -1


print(equilibrium_index([1, 7, 3, 6, 5, 6]))  # 3
print(equilibrium_index([1, 2, 3]))  # -1
