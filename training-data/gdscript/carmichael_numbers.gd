extends SceneTree

# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
func gcd_int(a: int, b: int) -> int:
	while b != 0:
		var t := a % b
		a = b
		b = t
	return a

func pow_mod(b: int, e: int, m: int) -> int:
	var r := 1
	b = b % m
	while e > 0:
		if e & 1 == 1:
			r = r * b % m
		b = b * b % m
		e >>= 1
	return r

func is_prime(n: int) -> bool:
	var p := 2
	while p * p <= n:
		if n % p == 0:
			return false
		p += 1
	return n > 1

func is_carmichael(n: int) -> bool:
	if is_prime(n):
		return false
	for a in range(2, n):
		if gcd_int(a, n) == 1 and pow_mod(a, n - 1, n) != 1:
			return false
	return true

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(3, 3000, 2):
		if is_carmichael(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
