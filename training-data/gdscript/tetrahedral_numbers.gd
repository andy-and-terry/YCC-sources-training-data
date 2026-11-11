# Tetrahedral numbers n(n+1)(n+2)/6
extends Node

func term(n: int) -> int:
	return ((n * (n + 1)) * (n + 2))/6

func _ready() -> void:
	var out := []
	for n in range(10):
		out.append(str(term(n)))
	print(" ".join(out))
