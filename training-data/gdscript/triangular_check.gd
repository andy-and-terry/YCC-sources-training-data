extends SceneTree

# n is triangular iff 8n + 1 is a perfect square.
func is_triangular(n: int) -> bool:
	var s := 8 * n + 1
	var r := int(round(sqrt(s)))
	return r * r == s

func _init() -> void:
	var out := []
	for n in range(0, 21):
		if is_triangular(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
