def move_zeroes(nums):
    write = 0
    for x in nums:
        if x != 0:
            nums[write] = x
            write += 1
    for i in range(write, len(nums)):
        nums[i] = 0
    return nums


if __name__ == "__main__":
    print(move_zeroes([0, 1, 0, 3, 12, 0, 7]))
