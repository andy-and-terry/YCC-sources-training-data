extends Node

func to_roman(n: int) -> String:
	var values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
	var symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
	var result = ""
	var remaining = n
	for i in range(values.size()):
		while remaining >= values[i]:
			result += symbols[i]
			remaining -= values[i]
	return result

func _ready():
	print(to_roman(1994))
