def egg_drop(eggs, floors):
    """Minimum trials needed in the worst case; uses moves-based DP."""
    dp = [0] * (eggs + 1)
    moves = 0
    while dp[eggs] < floors:
        moves += 1
        for e in range(eggs, 0, -1):
            dp[e] = dp[e] + dp[e - 1] + 1
    return moves


if __name__ == "__main__":
    for e, f in ((1, 10), (2, 100), (3, 1000), (4, 5000)):
        print(f"{e} eggs, {f} floors -> {egg_drop(e, f)} drops")
