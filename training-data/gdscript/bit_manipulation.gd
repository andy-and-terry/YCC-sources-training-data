extends Node

func count_bits(n: int) -> int:
	var c := 0
	while n != 0:
		n &= n - 1
		c += 1
	return c

func _ready():
	var x := 0b101100
	print(count_bits(x))
	print(x & 0xF, " ", x | 1, " ", x ^ 0xFF)
	print(x << 2, " ", x >> 2)
	print((x & (1 << 2)) != 0)
	x |= 1
	x &= ~(1 << 5)
	print(x)
	print("power of two: ", 64 & 63 == 0)
