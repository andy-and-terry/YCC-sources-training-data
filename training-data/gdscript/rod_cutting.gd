extends Node

func rod_cutting(prices: Array, length: int) -> int:
	var dp = [0]
	for i in range(1, length + 1):
		var best = -1
		for cut in range(1, i + 1):
			if cut <= prices.size():
				var value = prices[cut - 1] + dp[i - cut]
				if value > best:
					best = value
		dp.append(best)
	return dp[length]

func _ready():
	var prices = [1, 5, 8, 9, 10, 17, 17, 20]
	for length in range(1, prices.size() + 1):
		print("length %d -> best value %d" % [length, rod_cutting(prices, length)])
