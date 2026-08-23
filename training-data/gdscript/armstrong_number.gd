extends Node

func is_armstrong(n: int) -> bool:
	var digits = str(n)
	var power = digits.length()
	var total = 0
	for c in digits:
		total += pow(int(c), power)
	return total == n

func _ready():
	print(is_armstrong(153))
	print(is_armstrong(154))
