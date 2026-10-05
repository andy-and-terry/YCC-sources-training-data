extends Node

func is_power_of_two(n: int) -> bool:
	return n > 0 and (n & (n - 1)) == 0

func count_bits(n: int) -> int:
	var c := 0
	while n != 0:
		n &= n - 1
		c += 1
	return c

func _ready():
	print(is_power_of_two(64), " ", is_power_of_two(65))
	print(count_bits(0b101101))
	print(6 ^ 3)
	print(1 << 10)
	print(-16 >> 2)
	print(0b1100 | 0b0011)
	print(~5)
	print(12 & 10)
