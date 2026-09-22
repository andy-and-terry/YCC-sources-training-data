extends Node

func lis_length(nums: Array) -> int:
	if nums.is_empty():
		return 0
	var n = nums.size()
	var dp = []
	dp.resize(n)
	dp.fill(1)
	for i in range(1, n):
		for j in range(i):
			if nums[j] < nums[i] and dp[j] + 1 > dp[i]:
				dp[i] = dp[j] + 1
	var best = 0
	for length in dp:
		best = max(best, length)
	return best

func _ready():
	print(lis_length([10, 9, 2, 5, 3, 7, 101, 18]))
	print(lis_length([]))
