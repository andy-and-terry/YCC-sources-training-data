extends Node

func has_subset_sum(nums: Array, target: int) -> bool:
	var dp = []
	dp.resize(target + 1)
	dp.fill(false)
	dp[0] = true
	for num in nums:
		for cap in range(target, num - 1, -1):
			if dp[cap - num]:
				dp[cap] = true
	return dp[target]

func _ready():
	var nums = [3, 34, 4, 12, 5, 2]
	print(has_subset_sum(nums, 9))
	print(has_subset_sum(nums, 10))
	print(has_subset_sum(nums, 27))
