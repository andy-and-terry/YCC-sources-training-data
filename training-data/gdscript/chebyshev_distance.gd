extends Node

func chebyshev(a: Array, b: Array) -> int:
	var m := 0
	for i in a.size():
		m = max(m, abs(a[i] - b[i]))
	return m

func _ready() -> void:
	print(chebyshev([1, 2], [4, 6]))
