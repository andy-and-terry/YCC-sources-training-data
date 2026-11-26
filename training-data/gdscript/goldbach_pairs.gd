extends SceneTree
# Goldbach partitions of 100; expect 6.
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
	var pairs := []
	for p in range(2, 51):
		if is_prime(p) and is_prime(100 - p):
			pairs.append([p, 100 - p])
	print(pairs.size(), " ", pairs)
	quit()
