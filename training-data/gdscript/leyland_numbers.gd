extends SceneTree

# Leyland numbers: x^y + y^x for x >= y >= 2.
func _init() -> void:
	var vals := []
	for x in range(2, 5):
		for y in range(2, x + 1):
			vals.append(int(pow(x, y) + pow(y, x)))
	print(" ".join(vals.map(func(v): return str(v))))
	quit()
