extends Node

func is_pronic(x: int) -> bool:
	var n := int(floor(sqrt(x)))
	return n * (n + 1) == x

func _ready() -> void:
	var result := []
	for n in 10:
		result.append(n * (n + 1))
	print(result)  # [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
	print(is_pronic(56), " ", is_pronic(57))  # true false
