def max_product(nums):
    best = hi = lo = nums[0]
    for x in nums[1:]:
        if x < 0:
            hi, lo = lo, hi
        hi = max(x, hi * x)
        lo = min(x, lo * x)
        best = max(best, hi)
    return best


if __name__ == "__main__":
    print(max_product([2, 3, -2, 4]))
    print(max_product([-2, 0, -1]))
    print(max_product([-2, 3, -4]))
