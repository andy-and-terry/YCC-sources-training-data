extends SceneTree

# Aliquot sequence: replace n by the sum of its proper divisors.
func aliquot_sum(n: int) -> int:
	var s := 0
	for d in range(1, n / 2 + 1):
		if n % d == 0:
			s += d
	return s

func _init() -> void:
	var seq: Array[int] = [12]
	while seq[-1] > 1 and seq.size() < 20:
		seq.append(aliquot_sum(seq[-1]))
	print(" ".join(seq.map(func(x): return str(x))))
	quit()
