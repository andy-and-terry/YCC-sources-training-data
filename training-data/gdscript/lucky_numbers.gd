extends Node

# Lucky numbers: start with the odd numbers, then delete every k-th survivor,
# where k is the next surviving number
func lucky(limit: int) -> Array:
	var nums := []
	for n in range(1, limit, 2):
		nums.append(n)
	var idx := 1
	while idx < nums.size() and nums[idx] <= nums.size():
		var k: int = nums[idx]
		var kept := []
		for p in range(nums.size()):
			if (p + 1) % k != 0:
				kept.append(nums[p])
		nums = kept
		idx += 1
	return nums

func _ready():
	print(lucky(100))
