extends Node

const FACT := [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

func is_factorion(n: int) -> bool:
	var m := n
	var total := 0
	while m > 0:
		total += FACT[m % 10]
		m /= 10
	return total == n

func _ready() -> void:
	var found := []
	for n in range(1, 50000):
		if is_factorion(n):
			found.append(n)
	print(found)
