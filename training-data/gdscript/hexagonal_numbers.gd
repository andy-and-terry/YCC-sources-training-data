extends SceneTree

# Hexagonal numbers: n(2n-1).
func _init() -> void:
	var out: PackedStringArray = []
	for n in range(1, 11):
		out.append(str(n * (2 * n - 1)))
	print(" ".join(out))
	quit()
