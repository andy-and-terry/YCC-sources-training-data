extends Node

func cullen(n: int) -> int:
	return n * (1 << n) + 1

func _ready() -> void:
	for n in range(1, 6):
		print(n, " ", cullen(n))
