extends Node

func hanoi(n: int, a: String, b: String, c: String, out: Array) -> void:
	if n == 0:
		return
	hanoi(n - 1, a, c, b, out)
	out.append("%s->%s" % [a, c])
	hanoi(n - 1, b, a, c, out)

func _ready() -> void:
	var moves := []
	hanoi(3, "A", "B", "C", moves)
	print(moves.size(), ": ", " ".join(moves))
