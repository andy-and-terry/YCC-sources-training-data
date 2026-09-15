extends Node

func heapify(arr: Array, n: int, i: int):
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

func heap_sort(arr: Array):
	var n = arr.size()
	for i in range(n / 2 - 1, -1, -1):
		heapify(arr, n, i)
	for i in range(n - 1, 0, -1):
		var tmp = arr[0]
		arr[0] = arr[i]
		arr[i] = tmp
		heapify(arr, i, 0)

func _ready():
	var arr = [5, 3, 8, 1, 9, 2]
	heap_sort(arr)
	print(arr)
