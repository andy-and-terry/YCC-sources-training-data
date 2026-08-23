extends Node

func two_sum(nums: Array, target: int) -> Array:
	var seen = {}
	for i in range(nums.size()):
		var complement = target - nums[i]
		if seen.has(complement):
			return [seen[complement], i]
		seen[nums[i]] = i
	return []

func _ready():
	print(two_sum([2, 7, 11, 15], 9))
