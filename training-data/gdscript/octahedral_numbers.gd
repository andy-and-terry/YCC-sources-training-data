extends Node

# n(2n^2+1)/3
func term(n: int) -> int:
	return (n * (((2 * n) * n) + 1)) / 3


func _ready() -> void:
	for n in range(1, 16):
		print("%d -> %d" % [n, term(n)])
