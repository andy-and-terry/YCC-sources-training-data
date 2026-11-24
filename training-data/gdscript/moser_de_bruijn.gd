extends SceneTree

# Moser-de Bruijn sequence: binary digits of n read in base 4.
func moser(n: int) -> int:
	var result := 0
	var place := 1
	while n > 0:
		if n & 1 == 1:
			result += place
		n >>= 1
		place *= 4
	return result

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(12):
		out.append(str(moser(n)))
	print(" ".join(out))
	quit()
