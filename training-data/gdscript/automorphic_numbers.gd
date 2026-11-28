extends Node

func is_automorphic(n: int) -> bool:
	return str(n * n).ends_with(str(n))

func _ready() -> void:
	var result := []
	for n in range(0, 1000):
		if is_automorphic(n):
			result.append(n)
	print(result)  # [0, 1, 5, 6, 25, 76, 376, 625]
