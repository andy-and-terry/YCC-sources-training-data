extends SceneTree

func sigma(n: int) -> int:
	var s := 0
	for d in range(1, n + 1):
		if n % d == 0:
			s += d
	return s

func _init() -> void:
	var out := []
	for n in range(1, 100):
		if sigma(sigma(n)) == 2 * n:
			out.append(n)
	print(out) # [2, 4, 16, 64]
	quit()
