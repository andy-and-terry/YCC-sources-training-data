extends Node

func max_subarray(a: Array) -> int:
	var best: int = a[0]
	var cur: int = a[0]
	for i in range(1, a.size()):
		cur = max(a[i], cur + a[i])
		best = max(best, cur)
	return best

func _ready():
	print(max_subarray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
	print(max_subarray([-3, -1, -2]))
