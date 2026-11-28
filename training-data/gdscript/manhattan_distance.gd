extends Node

func manhattan(a: Array, b: Array) -> int:
	var s := 0
	for i in a.size():
		s += abs(a[i] - b[i])
	return s

func _ready() -> void:
	print(manhattan([1, 2], [4, 6]))
