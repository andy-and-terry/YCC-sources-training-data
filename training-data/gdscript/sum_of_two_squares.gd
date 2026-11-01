extends SceneTree

# Positive n expressible as a*a + b*b with a, b >= 0.
func representable(n: int) -> bool:
	var a := 0
	while a * a <= n:
		var b := int(round(sqrt(n - a * a)))
		if a * a + b * b == n:
			return true
		a += 1
	return false

func _init() -> void:
	var out := []
	for n in range(1, 31):
		if representable(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
