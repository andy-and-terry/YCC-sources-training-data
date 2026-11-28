extends Node

func sigma(n: int) -> int:
	var s := 0
	for d in range(1, n + 1):
		if n % d == 0:
			s += d
	return s

func _ready() -> void:
	var out: Array = []
	for n in range(1, 21):
		if sigma(n) < 2 * n:
			out.append(n)
	print(out)
