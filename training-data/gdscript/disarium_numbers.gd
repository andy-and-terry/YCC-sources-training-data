extends SceneTree

# Disarium numbers: digits raised to their 1-based positions sum to n.
func is_disarium(n: int) -> bool:
	var s := str(n)
	var total := 0
	for i in range(s.length()):
		total += int(pow(int(s[i]), i + 1))
	return total == n

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(1, 1000):
		if is_disarium(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
