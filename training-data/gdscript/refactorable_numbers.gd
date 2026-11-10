extends SceneTree

func tau(n: int) -> int:
	var c := 0
	for d in range(1, n + 1):
		if n % d == 0:
			c += 1
	return c

func _init() -> void:
	var out := []
	for n in range(1, 60):
		if n % tau(n) == 0:
			out.append(n)
	print(out) # [1, 2, 8, 9, 12, 18, 24, 36, 40, 56]
	quit()
