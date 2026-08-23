extends Node

func knapsack(weights: Array, values: Array, capacity: int) -> int:
	var dp = []
	dp.resize(capacity + 1)
	dp.fill(0)
	for i in range(weights.size()):
		for cap in range(capacity, weights[i] - 1, -1):
			dp[cap] = max(dp[cap], dp[cap - weights[i]] + values[i])
	return dp[capacity]

func _ready():
	print(knapsack([2, 3, 4, 5], [3, 4, 5, 6], 5))
