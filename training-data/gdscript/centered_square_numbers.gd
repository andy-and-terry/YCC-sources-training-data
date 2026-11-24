extends SceneTree

# Centered square numbers: n^2 + (n+1)^2.
func _init() -> void:
	var out: PackedStringArray = []
	for n in range(10):
		out.append(str(n * n + (n + 1) * (n + 1)))
	print(" ".join(out))
	quit()
