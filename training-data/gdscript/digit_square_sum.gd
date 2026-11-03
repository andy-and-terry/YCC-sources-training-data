extends Node

func digit_square_sum(n: int) -> int:
	var m := absi(n)
	var total := 0
	while m > 0:
		var d := m % 10
		total += d * d
		m /= 10
	return total

func _ready() -> void:
	print(digit_square_sum(123))
	print(digit_square_sum(-99))
