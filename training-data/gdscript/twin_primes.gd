extends SceneTree
# Twin primes below 100; expect 8.
# Run with: godot --headless -s <file>

func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var d := 2
	while d * d <= n:
		if n % d == 0:
			return false
		d += 1
	return true

func _init() -> void:
	var c := 0
	for p in range(2, 100):
		if is_prime(p) and is_prime(p + 2):
			c += 1
	print(c)
	quit()
