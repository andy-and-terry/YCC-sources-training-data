extends Node

func bubble_sort(arr: Array) -> Array:
	var a = arr.duplicate()
	for i in range(a.size()):
		for j in range(a.size() - i - 1):
			if a[j] > a[j + 1]:
				var temp = a[j]
				a[j] = a[j + 1]
				a[j + 1] = temp
	return a

func _ready():
	print(bubble_sort([5, 2, 9, 1, 5, 6]))
