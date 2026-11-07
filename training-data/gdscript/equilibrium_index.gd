func equilibrium_index(nums: Array) -> int:
	var total := 0
	for v in nums:
		total += v
	var left := 0
	for i in nums.size():
		if left == total - left - nums[i]:
			return i
		left += nums[i]
	return -1

func _ready() -> void:
	print(equilibrium_index([1, 7, 3, 6, 5, 6]))  # 3
