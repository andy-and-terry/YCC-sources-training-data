from functools import reduce
from operator import xor


def single_number(nums):
    return reduce(xor, nums)


print(single_number([4, 1, 2, 1, 2]))  # 4
