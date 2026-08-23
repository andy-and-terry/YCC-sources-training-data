extends Node

func binary_search(arr: Array, target) -> int:
	var low = 0
	var high = arr.size() - 1
	while low <= high:
		var mid = (low + high) / 2
		if arr[mid] == target:
			return mid
		elif arr[mid] < target:
			low = mid + 1
		else:
			high = mid - 1
	return -1

func _ready():
	print(binary_search([1, 3, 5, 7, 9, 11], 7))
