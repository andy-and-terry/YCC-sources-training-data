extends Node
# Goldbach pair.
func is_prime(n: int) -> bool:
	if n < 2: return false
	var d := 2
	while d * d <= n:
		if n % d == 0: return false
		d += 1
	return true

func goldbach(n: int) -> Vector2i:
	for p in range(2, n / 2 + 1):
		if is_prime(p) and is_prime(n - p): return Vector2i(p, n - p)
	return Vector2i.ZERO

func _ready():
	print(goldbach(28))
