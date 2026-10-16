extends Node

func popcount(n: int) -> int:
	var c = 0
	while n != 0:
		n &= n - 1
		c += 1
	return c

func hamming(a: int, b: int) -> int:
	return popcount(a ^ b)

func _ready():
	print(popcount(0), popcount(255), popcount(1023))
	print(hamming(1, 4), hamming(0b1011, 0b1101))
	print(1 << 10, 1024 >> 3, -8 >> 1)
