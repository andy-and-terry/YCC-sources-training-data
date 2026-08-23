extends Node

func factorial(n: int) -> int:
	var result = 1
	for i in range(1, n + 1):
		result *= i
	return result

func _ready():
	print(factorial(10))
