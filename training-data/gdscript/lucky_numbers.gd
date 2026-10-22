extends Node

# Start with odds, then delete every k-th survivor for each surviving k
func lucky(limit: int) -> Array:
	var nums := []
	for v in range(1, limit + 1, 2):
		nums.append(v)
	var i := 1
	while i < nums.size() and nums[i] <= nums.size():
		var step: int = nums[i]
		var kept := []
		for j in range(nums.size()):
			if (j + 1) % step != 0:
				kept.append(nums[j])
		nums = kept
		i += 1
	return nums

func _ready():
	print(" ".join(lucky(50).map(func(x): return str(x))))
