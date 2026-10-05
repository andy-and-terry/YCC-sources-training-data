extends Node

func merge_intervals(intervals: Array) -> Array:
	var sorted := intervals.duplicate()
	sorted.sort_custom(func(a, b): return a[0] < b[0])
	var out: Array = []
	for iv in sorted:
		if not out.is_empty() and iv[0] <= out.back()[1]:
			out.back()[1] = max(out.back()[1], iv[1])
		else:
			out.append([iv[0], iv[1]])
	return out

func _ready():
	print(merge_intervals([[1, 3], [8, 10], [2, 6], [15, 18]]))
