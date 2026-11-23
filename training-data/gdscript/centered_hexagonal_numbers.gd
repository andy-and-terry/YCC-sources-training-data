extends Node

# 3n(n-1)+1
func term(n: int) -> int:
	return ((3 * n) * (n - 1)) + 1


func _ready() -> void:
	for n in range(1, 16):
		print("%d -> %d" % [n, term(n)])
