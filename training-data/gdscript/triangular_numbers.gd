extends Node

func triangular(count: int) -> Array[int]:
	var out: Array[int] = []
	var total := 0
	for n in range(1, count + 1):
		total += n
		out.append(total)
	return out

func _ready() -> void:
	print(triangular(10))
