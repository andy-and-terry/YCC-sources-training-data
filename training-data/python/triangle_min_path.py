def minimum_total(triangle):
    dp = triangle[-1][:]
    for row in range(len(triangle) - 2, -1, -1):
        for i in range(len(triangle[row])):
            dp[i] = triangle[row][i] + min(dp[i], dp[i + 1])
    return dp[0]


print(minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]))  # 11
