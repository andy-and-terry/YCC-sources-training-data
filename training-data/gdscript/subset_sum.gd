extends Node

func has_subset_sum(nums: Array, target: int) -> bool:
	var n = nums.size()
	var dp = []
	for i in range(n + 1):
		var row = []
		row.resize(target + 1)
		row.fill(false)
		row[0] = true
		dp.append(row)

	for i in range(1, n + 1):
		for t in range(1, target + 1):
			dp[i][t] = dp[i - 1][t]
			if nums[i - 1] <= t and dp[i - 1][t - nums[i - 1]]:
				dp[i][t] = true

	return dp[n][target]

func _ready():
	print(has_subset_sum([1, 5, 11, 5], 11))
	print(has_subset_sum([1, 5, 11, 5], 23))
