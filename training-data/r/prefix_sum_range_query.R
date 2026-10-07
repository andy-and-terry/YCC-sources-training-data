nums <- c(3, 1, 4, 1, 5, 9, 2, 6)
prefix <- c(0, cumsum(nums))   # prefix[i + 1] = sum of first i elements

range_sum <- function(l, r) prefix[r + 1] - prefix[l]  # 1-based, inclusive

print(range_sum(1, 8))
print(range_sum(3, 5))
print(sum(nums[3:5]))

print(cumprod(1:6))
print(cummax(c(1, 3, 2, 5, 4)))
print(diff(prefix))
