extends Node

# n(n+1)(2n+1)/6
func term(n: int) -> int:
	return ((n * (n + 1)) * ((2 * n) + 1)) / 6


func _ready() -> void:
	for n in range(1, 16):
		print("%d -> %d" % [n, term(n)])
