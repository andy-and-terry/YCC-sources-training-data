extends SceneTree

# Pentagonal numbers: n(3n-1)/2.
func _init() -> void:
	var out: PackedStringArray = []
	for n in range(1, 11):
		out.append(str(n * (3 * n - 1) / 2))
	print(" ".join(out))
	quit()
