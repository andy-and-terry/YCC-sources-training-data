extends SceneTree

# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
func _init() -> void:
	var out: PackedStringArray = []
	for n in range(10):
		out.append(str(n * (n + 1) / 2 + 1))
	print(" ".join(out))
	quit()
