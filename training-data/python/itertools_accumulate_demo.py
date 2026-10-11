import itertools
import operator

nums = [3, 1, 4, 1, 5, 9, 2, 6]
print(list(itertools.accumulate(nums)))
print(list(itertools.accumulate(nums, max)))
print(list(itertools.accumulate(nums, operator.mul)))
print(list(itertools.accumulate(nums, initial=100)))

# running balance with deposits and withdrawals
txns = [100, -30, -20, 50, -75]
print(list(itertools.accumulate(txns)))
