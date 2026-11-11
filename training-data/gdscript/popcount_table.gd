# Population count (number of set bits) for 0..15
extends Node

func bits(n: int) -> int:
	var c := 0
	while n > 0:
		c += n & 1
		n >>= 1
	return c

func _ready() -> void:
	var out := []
	for n in range(16):
		out.append(bits(n))
	print(out)
