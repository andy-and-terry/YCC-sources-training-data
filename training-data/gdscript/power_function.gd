extends Node

func power(base: int, exp: int) -> int:
	if exp == 0:
		return 1
	if exp % 2 == 0:
		var half = power(base, exp / 2)
		return half * half
	return base * power(base, exp - 1)

func _ready():
	print(power(2, 10))
	print(power(3, 5))
