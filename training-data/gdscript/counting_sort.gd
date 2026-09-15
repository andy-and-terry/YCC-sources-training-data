extends Node

func counting_sort(arr: Array) -> Array:
	if arr.is_empty():
		return arr
	var max_val = arr[0]
	for v in arr:
		if v > max_val:
			max_val = v
	var counts = []
	counts.resize(max_val + 1)
	counts.fill(0)
	for v in arr:
		counts[v] += 1
	var result = []
	for value in range(counts.size()):
		for i in range(counts[value]):
			result.append(value)
	return result

func _ready():
	print(counting_sort([4, 2, 2, 8, 3, 3, 1]))
