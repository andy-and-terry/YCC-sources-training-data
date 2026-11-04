extends Node

func gcd(a: int, b: int) -> int:
	while b != 0:
		var t := a % b
		a = b
		b = t
	return abs(a)

func gcd_all(nums: Array) -> int:
	return nums.reduce(func(acc, n): return gcd(acc, n), 0)

func _ready() -> void:
	print(gcd_all([12, 18, 24]))
	print(gcd_all([7, 13]))
