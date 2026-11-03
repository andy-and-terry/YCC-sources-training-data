extends Node

func is_perfect_square(n: int) -> bool:
	if n < 0:
		return false
	var r := roundi(sqrt(n))
	return r * r == n

func _ready() -> void:
	var out := []
	for n in range(30):
		if is_perfect_square(n):
			out.append(n)
	print(out)
