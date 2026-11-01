extends SceneTree

# Sum of prime factors counted with multiplicity.
func sopfr(n: int) -> int:
	var total := 0
	var p := 2
	while p * p <= n:
		while n % p == 0:
			total += p
			n /= p
		p += 1
	if n > 1:
		total += n
	return total

func _init() -> void:
	var out := []
	for n in range(2, 110):
		if sopfr(n) == sopfr(n + 1):
			out.append(str(n))
	print(" ".join(out))
	quit()
