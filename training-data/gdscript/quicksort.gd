extends Node

func quicksort(items: Array) -> Array:
	if items.size() <= 1:
		return items
	var pivot = items[items.size() / 2]
	var left = []
	var mid = []
	var right = []
	for x in items:
		if x < pivot:
			left.append(x)
		elif x == pivot:
			mid.append(x)
		else:
			right.append(x)
	return quicksort(left) + mid + quicksort(right)

func _ready():
	print(quicksort([5, 3, 8, 1, 9, 2]))
