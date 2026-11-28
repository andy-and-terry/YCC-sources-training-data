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
	var n := 28
	for p in range(2, n / 2 + 1):
		if is_prime(p) and is_prime(n - p):
			print("%d + %d" % [p, n - p])
