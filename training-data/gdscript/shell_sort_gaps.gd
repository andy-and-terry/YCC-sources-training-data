extends Node

func shell_sort(arr: Array) -> Array:
	var a := arr.duplicate()
	var gap := a.size() / 2
	while gap > 0:
		for i in range(gap, a.size()):
			var tmp = a[i]
			var j := i
			while j >= gap and a[j - gap] > tmp:
				a[j] = a[j - gap]
				j -= gap
			a[j] = tmp
		gap /= 2
	return a

func _ready() -> void:
	print(shell_sort([23, 12, 1, 8, 34, 54, 2, 3]))
