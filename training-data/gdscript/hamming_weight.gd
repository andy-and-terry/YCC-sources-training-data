extends Node

func popcount(n: int) -> int:
	var c := 0
	while n != 0:
		n &= n - 1
		c += 1
	return c

func _ready() -> void:
	print(popcount(0xB7), " ", popcount(255))
