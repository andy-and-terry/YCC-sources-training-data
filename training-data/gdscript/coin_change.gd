extends Node

func min_coins(coins: Array, amount: int) -> int:
	var dp = []
	dp.resize(amount + 1)
	dp.fill(-1)
	dp[0] = 0
	for n in range(1, amount + 1):
		for c in coins:
			if c <= n and dp[n - c] != -1:
				if dp[n] == -1 or dp[n - c] + 1 < dp[n]:
					dp[n] = dp[n - c] + 1
	return dp[amount]

func _ready():
	print(min_coins([1, 2, 5], 11))
