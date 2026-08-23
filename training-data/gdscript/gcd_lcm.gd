extends Node

func gcd(a: int, b: int) -> int:
	while b != 0:
		var t = b
		b = a % b
		a = t
	return abs(a)

func lcm(a: int, b: int) -> int:
	return abs(a * b) / gcd(a, b)

func _ready():
	print(gcd(48, 18))
	print(lcm(4, 6))
