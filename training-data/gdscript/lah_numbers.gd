extends SceneTree

# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
func fact(n: int) -> int:
	var f := 1
	for i in range(2, n + 1):
		f *= i
	return f

func comb(n: int, k: int) -> int:
	return fact(n) / (fact(k) * fact(n - k))

func _init() -> void:
	var n := 5
	var out: PackedStringArray = []
	for k in range(1, n + 1):
		out.append(str(comb(n - 1, k - 1) * fact(n) / fact(k)))
	print(" ".join(out))
	quit()
