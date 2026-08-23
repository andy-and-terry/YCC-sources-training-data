extends Node

func binary_to_decimal(s: String) -> int:
	var result = 0
	for c in s:
		result = result * 2 + int(c)
	return result

func _ready():
	print(binary_to_decimal("1011"))
