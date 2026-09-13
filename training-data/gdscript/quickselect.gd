extends Node

func partition(arr: Array, low: int, high: int) -> int:
	var pivot = arr[high]
	var i = low
	for j in range(low, high):
		if arr[j] <= pivot:
			var tmp = arr[i]
			arr[i] = arr[j]
			arr[j] = tmp
			i += 1
	var tmp = arr[i]
	arr[i] = arr[high]
	arr[high] = tmp
	return i

func quickselect(arr: Array, low: int, high: int, k: int):
	if low == high:
		return arr[low]
	var pivot_index = partition(arr, low, high)
	if k == pivot_index:
		return arr[k]
	elif k < pivot_index:
		return quickselect(arr, low, pivot_index - 1, k)
	else:
		return quickselect(arr, pivot_index + 1, high, k)

func kth_smallest(arr: Array, k: int):
	return quickselect(arr.duplicate(), 0, arr.size() - 1, k - 1)

func _ready():
	var nums = [7, 10, 4, 3, 20, 15]
	print(kth_smallest(nums, 3))
