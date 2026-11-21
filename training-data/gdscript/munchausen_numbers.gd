extends SceneTree

# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
func is_munchausen(n: int) -> bool:
	var total := 0
	for c in str(n):
		var d := int(c)
		if d > 0:
			total += int(pow(d, d))
	return total == n

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(1, 5000):
		if is_munchausen(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
