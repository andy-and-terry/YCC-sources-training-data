extends Node

# n^2(n+1)/2
func term(n: int) -> int:
	return ((n * n) * (n + 1)) / 2


func _ready() -> void:
	for n in range(1, 16):
		print("%d -> %d" % [n, term(n)])
