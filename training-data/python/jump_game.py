def can_jump(nums):
    reach = 0
    for i, n in enumerate(nums):
        if i > reach:
            return False
        reach = max(reach, i + n)
    return True


def min_jumps(nums):
    jumps = end = far = 0
    for i in range(len(nums) - 1):
        far = max(far, i + nums[i])
        if i == end:
            jumps += 1
            end = far
    return jumps


if __name__ == "__main__":
    print(can_jump([2, 3, 1, 1, 4]), can_jump([3, 2, 1, 0, 4]))
    print(min_jumps([2, 3, 1, 1, 4]))
