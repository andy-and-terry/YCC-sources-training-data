from typing import List


def count_change_ways(coins: List[int], amount: int) -> int:
    """Number of distinct combinations (order-independent) that make amount.

    Distinct from coin_change.py, which finds the minimum number of coins;
    this counts *how many* ways exist, which needs the coins-outer loop to
    avoid counting permutations of the same combination separately.
    """
    ways = [0] * (amount + 1)
    ways[0] = 1
    for coin in coins:
        for total in range(coin, amount + 1):
            ways[total] += ways[total - coin]
    return ways[amount]


if __name__ == "__main__":
    print(count_change_ways([1, 2, 5], 5))
    print(count_change_ways([2, 5, 3, 6], 10))
