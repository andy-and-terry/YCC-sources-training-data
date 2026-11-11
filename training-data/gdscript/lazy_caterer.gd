# Lazy caterer sequence: max pieces from n cuts
extends Node

func term(n: int) -> int:
	return ((n * (n + 1))/2) + 1

func _ready() -> void:
	var out := []
	for n in range(10):
		out.append(str(term(n)))
	print(" ".join(out))
