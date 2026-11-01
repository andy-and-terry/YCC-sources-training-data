extends SceneTree

# Pernicious numbers: the popcount is prime.
func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var d := 2
	while d * d <= n:
		if n % d == 0:
			return false
		d += 1
	return true

func popcount(n: int) -> int:
	var c := 0
	while n > 0:
		c += n & 1
		n >>= 1
	return c

func _init() -> void:
	var out := []
	for n in range(1, 21):
		if is_prime(popcount(n)):
			out.append(str(n))
	print(" ".join(out))
	quit()
