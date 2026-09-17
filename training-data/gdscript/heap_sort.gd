extends Node

func heapify(arr: Array, n: int, i: int) -> void:
	var largest = i
	var left = 2 * i + 1
	var right = 2 * i + 2
	if left < n and arr[left] > arr[largest]:
		largest = left
	if right < n and arr[right] > arr[largest]:
		largest = right
	if largest != i:
		var tmp = arr[i]
		arr[i] = arr[largest]
		arr[largest] = tmp
		heapify(arr, n, largest)

func heap_sort(arr: Array) -> Array:
	var n = arr.size()
	for i in range(n / 2 - 1, -1, -1):
		heapify(arr, n, i)
	for i in range(n - 1, 0, -1):
		var tmp = arr[0]
		arr[0] = arr[i]
		arr[i] = tmp
		heapify(arr, i, 0)
	return arr

func _ready():
	print(heap_sort([9, 4, 7, 1, 3, 8, 2]))
