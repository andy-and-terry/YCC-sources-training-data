extends Node

func permute(nums: Array) -> Array:
	var result := []
	if nums.size() == 0:
		result.append([])
		return result
	for i in range(nums.size()):
		var rest := nums.duplicate()
		var current = rest.pop_at(i)
		for perm in permute(rest):
			perm.push_front(current)
			result.append(perm)
	return result

func _ready():
	var perms := permute([1, 2, 3])
	for p in perms:
		print(p)
	print("total permutations: %d" % perms.size())
