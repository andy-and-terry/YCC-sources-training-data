extends SceneTree

# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
func mobius(n: int) -> int:
	var result := 1
	var p := 2
	while p * p <= n:
		if n % p == 0:
			n /= p
			if n % p == 0:
				return 0
			result = -result
		p += 1
	return -result if n > 1 else result

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(1, 31):
		out.append(str(mobius(n)))
	print(" ".join(out))
	quit()
