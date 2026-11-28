extends Node

func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var d := 2
	while d * d <= n:
		if n % d == 0:
			return false
		d += 1
	return true

func _ready() -> void:
	for p in range(3, 49):
		if is_prime(p) and is_prime(p + 2):
			print("(%d, %d)" % [p, p + 2])
