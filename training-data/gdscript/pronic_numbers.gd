# Pronic numbers n(n+1)
extends Node

func term(n: int) -> int:
	return n * (n + 1)

func _ready() -> void:
	var out := []
	for n in range(10):
		out.append(str(term(n)))
	print(" ".join(out))
