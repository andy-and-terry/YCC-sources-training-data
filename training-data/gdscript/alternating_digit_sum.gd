extends Node

func alternating_digit_sum(value: int) -> int:
	var n := value
	var total := 0
	var sign := 1
	while n > 0:
		total += sign * (n % 10)
		sign = -sign
		n /= 10
	return total

func _ready() -> void:
	for n in [1234, 99999, 1000]:
		print(n, " ", alternating_digit_sum(n))
