extends SceneTree

# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
func _init() -> void:
	var r := 0
	var out: PackedStringArray = []
	for i in range(8):
		r = r * 10 + 1
		out.append(str(r))
	print(" ".join(out))
	quit()
