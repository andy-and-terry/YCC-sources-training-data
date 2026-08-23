extends Node

func selection_sort(items: Array) -> Array:
	var arr = items.duplicate()
	for i in range(arr.size() - 1):
		var min_idx = i
		for j in range(i + 1, arr.size()):
			if arr[j] < arr[min_idx]:
				min_idx = j
		var tmp = arr[i]
		arr[i] = arr[min_idx]
		arr[min_idx] = tmp
	return arr

func _ready():
	print(selection_sort([5, 3, 8, 1, 9, 2]))
