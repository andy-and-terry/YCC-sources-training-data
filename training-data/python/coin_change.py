from typing import List


def coin_change(coins: List[int], amount: int) -> int:
    dp = [0] + [float("inf")] * amount
    for a in range(1, amount + 1):
        for coin in coins:
            if coin <= a:
                dp[a] = min(dp[a], dp[a - coin] + 1)
    return -1 if dp[amount] == float("inf") else dp[amount]


if __name__ == "__main__":
    print(coin_change([1, 2, 5], 11))
