extends Node

func sort_colors(arr: Array) -> void:
	var low = 0
	var mid = 0
	var high = arr.size() - 1

	while mid <= high:
		if arr[mid] == 0:
			var tmp = arr[low]
			arr[low] = arr[mid]
			arr[mid] = tmp
			low += 1
			mid += 1
		elif arr[mid] == 1:
			mid += 1
		else:
			var tmp = arr[mid]
			arr[mid] = arr[high]
			arr[high] = tmp
			high -= 1

func _ready():
	var colors = [2, 0, 2, 1, 1, 0, 2, 0]
	sort_colors(colors)
	print(colors)
