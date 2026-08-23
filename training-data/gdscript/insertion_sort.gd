extends Node

func insertion_sort(items: Array) -> Array:
	var arr = items.duplicate()
	for i in range(1, arr.size()):
		var key = arr[i]
		var j = i - 1
		while j >= 0 and arr[j] > key:
			arr[j + 1] = arr[j]
			j -= 1
		arr[j + 1] = key
	return arr

func _ready():
	print(insertion_sort([12, 11, 13, 5, 6]))
