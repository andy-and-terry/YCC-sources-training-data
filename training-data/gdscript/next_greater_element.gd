extends Node

func next_greater_elements(nums: Array) -> Array:
	var n := nums.size()
	var result := []
	result.resize(n)
	result.fill(-1)
	var stack := []
	for i in range(n):
		while stack.size() > 0 and nums[stack[-1]] < nums[i]:
			var idx = stack.pop_back()
			result[idx] = nums[i]
		stack.append(i)
	return result

func _ready():
	var nums := [4, 5, 2, 25, 7, 8]
	print("next greater elements: %s" % [next_greater_elements(nums)])
