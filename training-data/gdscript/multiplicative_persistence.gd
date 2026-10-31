extends Node

func persistence(value: int) -> int:
	var n := value
	var steps := 0
	while n >= 10:
		var product := 1
		while n > 0:
			product *= n % 10
			n /= 10
		n = product
		steps += 1
	return steps

func _ready() -> void:
	for n in [39, 77, 999, 10]:
		print(n, " ", persistence(n))
