extends SceneTree

# Read the binary digits of i as base-4 digits.
func moser(i: int) -> int:
	var value := 0
	var power := 1
	while i > 0:
		if i & 1 == 1:
			value += power
		power *= 4
		i >>= 1
	return value

func _init() -> void:
	var out := []
	for i in range(10):
		out.append(moser(i))
	print(out) # [0, 1, 4, 5, 16, 17, 20, 21, 64, 65]
	quit()
