extends Node

func merge(left: Array, right: Array) -> Array:
	var result = []
	var i = 0
	var j = 0
	while i < left.size() and j < right.size():
		if left[i] <= right[j]:
			result.append(left[i])
			i += 1
		else:
			result.append(right[j])
			j += 1
	result += left.slice(i, left.size())
	result += right.slice(j, right.size())
	return result

func merge_sort(items: Array) -> Array:
	if items.size() <= 1:
		return items
	var mid = items.size() / 2
	var left = merge_sort(items.slice(0, mid))
	var right = merge_sort(items.slice(mid, items.size()))
	return merge(left, right)

func _ready():
	print(merge_sort([5, 2, 9, 1, 5, 6]))
