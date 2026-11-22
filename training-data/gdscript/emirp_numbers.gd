extends SceneTree

# Emirps: primes whose digit reversal is a different prime.
func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var d := 2
	while d * d <= n:
		if n % d == 0:
			return false
		d += 1
	return true

func reverse_num(n: int) -> int:
	var r := 0
	while n > 0:
		r = r * 10 + n % 10
		n /= 10
	return r

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(2, 200):
		var r := reverse_num(n)
		if r != n and is_prime(n) and is_prime(r):
			out.append(str(n))
	print(" ".join(out))
	quit()
