extends Node
# Bead (gravity) sort.
func bead_sort(nums: Array) -> Array:
	var cols := []
	for i in range(nums.max()):
		cols.append(nums.filter(func(n): return n > i).size())
	var out := []
	for r in range(nums.size()):
		out.push_front(cols.filter(func(c): return c > r).size())
	return out

func _ready():
	print(bead_sort([5, 3, 1, 4, 2]))
