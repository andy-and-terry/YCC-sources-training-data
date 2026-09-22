extends Node

func next_greater_element(nums: Array) -> Array:
	var result = []
	result.resize(nums.size())
	for i in range(nums.size()):
		result[i] = -1
	var stack = []
	for i in range(nums.size()):
		while not stack.is_empty() and nums[stack[stack.size() - 1]] < nums[i]:
			var idx = stack.pop_back()
			result[idx] = nums[i]
		stack.append(i)
	return result

func _ready():
	print(next_greater_element([2, 1, 2, 4, 3]))
