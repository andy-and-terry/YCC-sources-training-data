extends SceneTree

# Fibbinary numbers: no two adjacent 1 bits.
func _init() -> void:
	var out: PackedStringArray = []
	for n in range(50):
		if n & (n >> 1) == 0:
			out.append(str(n))
	print(" ".join(out))
	quit()
