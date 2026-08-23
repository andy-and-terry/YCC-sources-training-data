extends Node

func digit_sum(n: int) -> int:
	var sum = 0
	var num = n
	while num > 0:
		sum += num % 10
		num /= 10
	return sum

func _ready():
	print(digit_sum(12345))
