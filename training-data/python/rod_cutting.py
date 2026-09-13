from functools import lru_cache


def rod_cutting(prices, length):
    @lru_cache(maxsize=None)
    def best(n):
        if n == 0:
            return 0
        return max(prices[i - 1] + best(n - i) for i in range(1, n + 1))

    return best(length)


if __name__ == "__main__":
    prices = [1, 5, 8, 9, 10, 17, 17, 20]
    print(rod_cutting(prices, 8))
    print(rod_cutting(prices, 4))
