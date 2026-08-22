extends Node

func gcd(a: int, b: int) -> int:
	while b != 0:
		var temp = b
		b = a % b
		a = temp
	return a

func _ready():
	print(gcd(48, 18))
	print(gcd(100, 75))
