from typing import List


def has_subset_sum(nums: List[int], target: int) -> bool:
    n = len(nums)
    dp = [[False] * (target + 1) for _ in range(n + 1)]
    for i in range(n + 1):
        dp[i][0] = True
    for i in range(1, n + 1):
        for t in range(1, target + 1):
            dp[i][t] = dp[i - 1][t]
            if nums[i - 1] <= t:
                dp[i][t] = dp[i][t] or dp[i - 1][t - nums[i - 1]]
    return dp[n][target]


if __name__ == "__main__":
    print(has_subset_sum([3, 34, 4, 12, 5, 2], 9))
