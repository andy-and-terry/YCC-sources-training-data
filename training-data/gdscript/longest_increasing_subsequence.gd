extends Node

func length_of_lis(nums: Array) -> int:
	if nums.is_empty():
		return 0
	var dp = []
	dp.resize(nums.size())
	dp.fill(1)
	for i in range(1, nums.size()):
		for j in range(i):
			if nums[j] < nums[i] and dp[j] + 1 > dp[i]:
				dp[i] = dp[j] + 1
	var best = 0
	for length in dp:
		best = max(best, length)
	return best

func _ready():
	print(length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]))
	print(length_of_lis([0, 1, 0, 3, 2, 3]))
	print(length_of_lis([7, 7, 7, 7]))
