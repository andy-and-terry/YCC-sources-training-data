def can_partition(nums):
    total = sum(nums)
    if total % 2:
        return False
    target = total // 2
    reachable = 1  # bitset of reachable sums
    for x in nums:
        reachable |= reachable << x
    return bool(reachable >> target & 1)


if __name__ == "__main__":
    print(can_partition([1, 5, 11, 5]), can_partition([1, 2, 3, 5]))
