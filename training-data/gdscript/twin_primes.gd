extends SceneTree

# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
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
	var out: PackedStringArray = []
	for p in range(2, 100):
		if is_prime(p) and is_prime(p + 2):
			out.append(str(p))
	print(" ".join(out))
	quit()
