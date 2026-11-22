extends SceneTree

# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
func is_practical(n: int) -> bool:
	var reach := 1  # bit i set <=> i is a subset sum
	for d in range(1, n + 1):
		if n % d == 0:
			reach |= reach << d
	var mask := (1 << (n + 1)) - 1
	return (reach & mask) == mask

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(1, 41):
		if is_practical(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
