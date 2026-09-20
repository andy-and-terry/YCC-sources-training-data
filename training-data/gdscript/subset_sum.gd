extends Node

# Classic subset-sum decision problem via bottom-up DP: is there a subset of
# `nums` that adds up to exactly `target`?
func has_subset_sum(nums: Array, target: int) -> bool:
	var dp = []
	for _i in range(target + 1):
		dp.append(false)
	dp[0] = true

	for num in nums:
		for total in range(target, num - 1, -1):
			if dp[total - num]:
				dp[total] = true
	return dp[target]

func _ready():
	var nums = [3, 34, 4, 12, 5, 2]
	for target in [9, 10, 21, 100]:
		print("target=", target, " -> ", has_subset_sum(nums, target))
